Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 117C41770B2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30126E9CF;
	Tue,  3 Mar 2020 08:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B636E9CF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 08:04:35 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02383s6Z043529;
 Tue, 3 Mar 2020 08:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=qO4CCvDH3LQqqaia42lNfgTGpB0rLmvxXhDjVASIaN0=;
 b=mq2+hICT6DlA5btf/qBrMOY4HOtf8sMTh48fkkm3jaUTwjGLCqb4d4ZXuwmqc9aUY/7a
 WiIpwwoTlPPsMfKQh8cqZQB+6xSbwSyd13Y8fMyoN2zfRKMnphxcBbivQaPh0jDA/i8N
 mytqRwMl99rP7Ea7NWmw462tyMiEnjDgtxzN8JjOi+twYhhcfuHXBDHKHH+dgujxl3lF
 OSkBCjsn5uWjKA4+MSqwwAsH22YkybiWbdUTOESpzFw9l3pKwd5M4efNia84QI4yIdh4
 GDExsu53vJ5wpUBqXCZqGqwmIocTkjMgFUCyjwnSO+fVLe3SLKkGTQX5eNBEJ1H6VW9U Kg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2yffcudb3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 08:04:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0237v7uX017106;
 Tue, 3 Mar 2020 08:04:24 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2yg1gwvhxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 08:04:23 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02384IGF019279;
 Tue, 3 Mar 2020 08:04:19 GMT
Received: from kadam (/129.205.23.165) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Mar 2020 00:04:17 -0800
Date: Tue, 3 Mar 2020 11:04:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
Message-ID: <20200303080406.GC24372@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302222631.3861340-4-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030061
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030062
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: kbuild-all@lists.01.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

I love your patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Daniel-Vetter/drm_device-managed-resources-v4/20200303-071023
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/drm_drv.c:843 drm_dev_release() error: dereferencing freed memory 'dev'

# https://github.com/0day-ci/linux/commit/5aba700d4c32ae5722a9931c959b13a6217a86e2
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 5aba700d4c32ae5722a9931c959b13a6217a86e2
vim +/dev +843 drivers/gpu/drm/drm_drv.c

099d1c290e2ebc drivers/gpu/drm/drm_stub.c David Herrmann 2014-01-29  826  static void drm_dev_release(struct kref *ref)
0dc8fe5985e01f drivers/gpu/drm/drm_stub.c David Herrmann 2013-10-02  827  {
099d1c290e2ebc drivers/gpu/drm/drm_stub.c David Herrmann 2014-01-29  828  	struct drm_device *dev = container_of(ref, struct drm_device, ref);
8f6599da8e772f drivers/gpu/drm/drm_stub.c David Herrmann 2013-10-20  829  
f30c92576af4bb drivers/gpu/drm/drm_drv.c  Chris Wilson   2017-02-02  830  	if (dev->driver->release) {
f30c92576af4bb drivers/gpu/drm/drm_drv.c  Chris Wilson   2017-02-02  831  		dev->driver->release(dev);
f30c92576af4bb drivers/gpu/drm/drm_drv.c  Chris Wilson   2017-02-02  832  	} else {
f30c92576af4bb drivers/gpu/drm/drm_drv.c  Chris Wilson   2017-02-02  833  		drm_dev_fini(dev);
5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  834  	}
5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  835  
5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  836  	drm_managed_release(dev);
5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  837  
5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  838  	if (!dev->driver->release && !dev->managed.final_kfree) {
5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  839  		WARN_ON(!list_empty(&dev->managed.resources));
0dc8fe5985e01f drivers/gpu/drm/drm_stub.c David Herrmann 2013-10-02  840  		kfree(dev);
                                                                                        ^^^^^^^^^^
Free

0dc8fe5985e01f drivers/gpu/drm/drm_stub.c David Herrmann 2013-10-02  841  	}
5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  842  
5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02 @843  	if (dev->managed.final_kfree)
                                                                                    ^^^^^
Dereference

5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  844  		kfree(dev->managed.final_kfree);
f30c92576af4bb drivers/gpu/drm/drm_drv.c  Chris Wilson   2017-02-02  845  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
