Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BCA5B1D3A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 14:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE37F10EAD6;
	Thu,  8 Sep 2022 12:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542A610EACF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 12:37:14 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id s13so9870785qvq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=WcekcDNFeJzxZPSod6l4pgL2wFziikSEFQBuSo6O52M=;
 b=KKyDjjUP/2p/6f7MjEn3kMEeJ9Uy23+vKM3cRtzBVt8VoKvtO19GZa9khWTOIgKXfU
 i8Wg2YqI7xe6VOUzHA1blR13LADAZdvcQEwpXYTDVgQlqE6jyPfQLsPIW6IFt8PC1Twz
 x1/2IkKExw1n1GVsGI2IcwHf6pcYkgxICIHCs5zME9TCi20awY/+j2rjTx1gBo2XawTZ
 hkPlifBFFpN7SWmfPgwIEuuHCjIW6iQRdS0k/Y45tBs1sBIxtTNCbnlbGq2Q0vhyPQMt
 KUHxfIEXp877QAvYoOIiX2SlcsbptrwrQuaci6jQ2mMpkHWg65mjQ+2UlqkyzZ97Lyu0
 1xuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=WcekcDNFeJzxZPSod6l4pgL2wFziikSEFQBuSo6O52M=;
 b=0iRQHPfOJOgXsnmauHC4Iuy/tw7TZ0Jm+6/dingU397uCzjQAOte+IzmmE8gVpzMgV
 bjGCMhNgP6yDC/UWOxgJxLLtOK0yYPbGwfkjwc9h7P0zFCWXZTVoNjPt00yvGaJ4l7xa
 /c+gFrcPGO+pbDOrDd9SILJh7XlU+sD+tQtZRvDkMEKfGk1ifTY74RJXfds3GlyTjVrL
 ls8BQAQdAgYx0bdO71clRnU2AJhRYxk5Sp8Fv+ljqYZNgSh9aTADMo0goteoblKhIfGY
 E68ALS6Oxmf2RrNf4ospE7Omu4/WbPc8Q0ZLdYenAsAlmvDdq/wD+aZVEUW3WPMSK8Ta
 UGOQ==
X-Gm-Message-State: ACgBeo0EzH3DKYrpJLtt6zDM2kRBDYc9MLzMxsvKJiL4ZfBaIt0B/R08
 zH/4OUs7kkaVtvqtZXr6qsP04Q==
X-Google-Smtp-Source: AA6agR4iyYT8//K0u4eC6uIKjTIJa5MHHn5Yfbf3X3qv/3RmHXDYo2nTKmbY5oFt97DH+rTTDZyaNQ==
X-Received: by 2002:a05:6214:c66:b0:499:2f1a:1cec with SMTP id
 t6-20020a0562140c6600b004992f1a1cecmr6905971qvj.93.1662640633361; 
 Thu, 08 Sep 2022 05:37:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 br7-20020a05622a1e0700b00344f91f6fe0sm14363098qtb.67.2022.09.08.05.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 05:37:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oWGmJ-0090gF-SU;
 Thu, 08 Sep 2022 09:37:07 -0300
Date: Thu, 8 Sep 2022 09:37:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 15/15] vfio: Add struct device to vfio_device
Message-ID: <Yxnh87ZIS2JwvN7D@ziepe.ca>
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-16-kevin.tian@intel.com>
 <50d82b01-86a3-e6a3-06f7-7f98e60131eb@redhat.com>
 <546463b8-54fa-2071-6a9a-e4087eb8bb2c@intel.com>
 <4c9350cd-c2ce-dc84-9a29-210907d2a2a2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c9350cd-c2ce-dc84-9a29-210907d2a2a2@redhat.com>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Airlie <airlied@linux.ie>,
 Eric Farman <farman@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 08, 2022 at 11:39:07AM +0200, Eric Auger wrote:

> >> I am not totally clear about remaining 'struct device *dev;' in
> >> vfio_device struct. I see it used in some places. Is it supposed to
> >> disappear at some point?
> >
> > no, Eric. *dev will not disappear, it stores the dev pointet passed in by
> > caller of vfio_init_device().
> 
> yeah I see but you have device->device.parent = device->dev;

IIRC we have a number of these redundancies now, often the drivers
store another copy of the dev too.

A significant use of dev is for printing things, what should be done
here is to create a subsystem wide vfio_warn/etc that takes in the
vfio_device, and then print properly from there. Now that we have a
struct device all the prints should also include the VFIO struct
device name, and then the PCI device perhaps in brackets.

Jason
