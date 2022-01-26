Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FFD49DCC1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 09:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871BF10E8B2;
	Thu, 27 Jan 2022 08:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2264 seconds by postgrey-1.36 at gabe;
 Wed, 26 Jan 2022 12:23:19 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6481B10E53D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 12:23:19 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QBfa3P018405; 
 Wed, 26 Jan 2022 11:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : references : date : in-reply-to : message-id : mime-version :
 content-type; s=pp1; bh=lVqDhrvnWrGuSL53mC1c1JVNCqrWUAZFD8NYSkNdxZ8=;
 b=ZR5diKuuG4vsmtZG11w0wcV2DhbnMee0WUa0chyJptnoKjvvqR/vFPe8SfdaokINFRve
 89i0z4eBZIrna1YlWgvhLV0AcHeV2xyNWvn/7qZZ//Wod3doHmreSKcCEsqbOzJV/mT/
 Gs/0m9LVbfpWo5lHtJRMSCaWr3U2KsF2b+Maf3uZmwIJiY5d99j5zkIcTz/s70/SC8BH
 Hk6QR10lom7J+rHkAS9UupWdDE6+RyDgBwnEPMg1w+aeX8tk1eXeucuYhfNz1sv7HDB4
 +u4NMHS79RjRadzZ1oHeHS0C1x2vOUk4rT3Cwgw5Lh/L3pQfCGMgE8rOI372XaDfUISE xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3du5n401ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 11:45:29 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20QBhOq6025478;
 Wed, 26 Jan 2022 11:45:28 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3du5n401tu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 11:45:28 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20QBh3r9021698;
 Wed, 26 Jan 2022 11:45:26 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3dr9j9kt9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 11:45:26 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20QBjOoh44368276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 11:45:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DC314C04A;
 Wed, 26 Jan 2022 11:45:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88B744C052;
 Wed, 26 Jan 2022 11:45:23 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 26 Jan 2022 11:45:23 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <CAKMK7uEqwyZuVheqyNG33Un4WK1cd1B+WBYbCmi20fZi0qVG2w@mail.gmail.com>
 <88ea01b8-3fdd-72cc-c3d8-e2890c68533b@gmx.de>
Date: Wed, 26 Jan 2022 12:45:23 +0100
In-Reply-To: <88ea01b8-3fdd-72cc-c3d8-e2890c68533b@gmx.de> (Helge Deller's
 message of "Wed, 26 Jan 2022 12:38:09 +0100")
Message-ID: <yt9d35lara98.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KhTGlHgQGrGYCalPGTfk1eZo6K604Rli
X-Proofpoint-GUID: RJBF4AwI7_gWpF38_Wai-x95Bwn9_1-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_03,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260068
X-Mailman-Approved-At: Thu, 27 Jan 2022 08:44:34 +0000
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Helge Deller <deller@gmx.de> writes:

> On 1/26/22 12:24, Daniel Vetter wrote:
>> And that point was about 5 years ago, and has been discussed at some
>> plumbers meanwhile, resulting in the staging TODO patches to make
>> these drm drivers to destage them.
>>
>> Fixing bugs in fbdev is all fine, reopening it for merging new drivers is not.
>
> We are on the same page!
> I'm not at all proposing to include new drivers for (relatively) new
> hardware into fbdev, which is capable to be written as DRM driver.

In my opinion that should be decided depending on the main usecase: If
it's X11 or similar, it should go to DRM. If its main use case is kernel
text console, it should go to fbdev.

I think the main concern/trouble about fbdev is the userspace interface,
and i personally would be totally fine seeing that go away (except the
ability to change video mode with fbset). For me its important as kernel
console for old systems, and don't want to run X11 on them.

Given the ongoing discussion about performance and drm, i don't expect
DRM gaining HW acceleration capabilities for text consoles. So i think
both should exist, just for different usecases.
