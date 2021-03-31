Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3952134FB51
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 10:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9057C89F4F;
	Wed, 31 Mar 2021 08:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EB089F4F
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 08:14:55 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12V896LI139714;
 Wed, 31 Mar 2021 08:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=lsc3mg7nU0ueGnJdcUBA2xWYe1i+CE0J6KLSUDz1BhA=;
 b=QO2dlVBFGTvJu25I+jsWym51qz/dMF6OACuz2cHRZRQT5Y18l/LkzHTZMqzGSg3Kjb44
 05hxAugUkgeP05XFY75zF3LqGp80SkfHuG+P4C+3XF9MijVst+l76+UD/SjBNhN1XffR
 549cF0hVwmfFfEWkdq/8ZP6rbyKSbtGqcSOSZ9Gfi2cZITNbWwWhaXbRDIy8QHNUjV/x
 7qdqMpufMdqARtELJFw493SIdfswc5+WG8dmKkCPnE6TIID8DFEWtfxONhlNpEMMr+Ov
 S5Jl/UmOoRsK7cUsDQCBXPnj32k/uCRxpwRg49gPUZ5mGreVHToTCu2pXmfwrIC1IQC0 cg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 37mad9sbck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 08:14:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12V8EpVG096475;
 Wed, 31 Mar 2021 08:14:52 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 37mac8c3jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 08:14:52 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12V8Ei8e022777;
 Wed, 31 Mar 2021 08:14:44 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 31 Mar 2021 01:14:44 -0700
Date: Wed, 31 Mar 2021 11:14:38 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: adrien.grassein@gmail.com
Subject: Re: [bug report] drm/bridge: Introduce LT8912B DSI to HDMI bridge
Message-ID: <20210331081438.GF2088@kadam>
References: <YGQu9uZ/d5ph+eS9@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YGQu9uZ/d5ph+eS9@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103300000
 definitions=main-2103310059
X-Proofpoint-ORIG-GUID: ZughSu65QZA8QmAir4yG0LocePAk_qNo
X-Proofpoint-GUID: ZughSu65QZA8QmAir4yG0LocePAk_qNo
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103300000
 definitions=main-2103310058
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 31, 2021 at 11:12:38AM +0300, Dan Carpenter wrote:
>    644          of_node_put(endpoint);
>    645  
>    646          lt->host_node = of_graph_get_remote_node(dev->of_node, 0, -1);
>    647          if (!lt->host_node) {
>    648                  dev_err(lt->dev, "%s: Failed to get remote port\n", __func__);
>    649                  ret = -ENODEV;
>    650                  goto end;
>    651          }
>    652  
>    653          port_node = of_graph_get_remote_node(dev->of_node, 1, -1);
>    654          if (!port_node) {
>    655                  dev_err(lt->dev, "%s: Failed to get connector port\n", __func__);
>    656                  ret = -ENODEV;
>    657                  goto err_free_host_node;
>    658          }
>    659  
>    660          lt->hdmi_port = of_drm_find_bridge(port_node);
>    661          if (IS_ERR(lt->hdmi_port)) {

This isn't an error pointer either.  of_drm_find_bridge() returns NULL.

regards,
dan carpenter


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
