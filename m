Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C411BF177
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9702D6EB63;
	Thu, 30 Apr 2020 07:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D1A6EB23
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 00:11:19 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03TNxD7h124735;
 Thu, 30 Apr 2020 00:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : references
 : from : subject : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=MLJR9DN4O/A/uFONXJl+Q439tVU3BgWi6zOSKZoQ45U=;
 b=l3sccS6jG58+jxKlpEQZ8SzJO0dEucT8SXZMhrFE0+UkVshm/rM48JtILHJVuOlXN4Wl
 O1UPKrl3hF13ucMgkDQVI26Im1vd4d1+eSSYQi3mdPx+M9Gc4Fql4fV3AzH3ds/Lboo7
 L1+L6pFP0lP9Sdok6XJm5G8yOLv63k0W5qpT1VhYh1ks8horT8B3oO6AtR5MWDK2+Ykl
 ltA/ZFpeBr9XN2ig1c/kOXebOrXqV+UbCI/V8ie0IB+iojfMB7UhH6gMEi9dPk3S48dm
 fp+bReXuBJKl/hDNtIQ49ynqe45SB1mmcedJ7fItlI5cL+XTfYjlRDIn/tWyTdVNRFL/ rQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 30nucg8n1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Apr 2020 00:11:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03U08FVC155687;
 Thu, 30 Apr 2020 00:11:16 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 30mxrw71a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Apr 2020 00:11:16 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03U0BBWx020739;
 Thu, 30 Apr 2020 00:11:11 GMT
Received: from [192.168.1.126] (/47.220.71.223)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 29 Apr 2020 17:11:10 -0700
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org, sam@ravnborg.org
References: <20200429143238.10115-1-tzimmermann@suse.de>
From: John Donnelly <John.P.Donnelly@Oracle.com>
Subject: re: [PATCH 00/17] drm/mgag200: Convert to atomic modesetting
Message-ID: <793986e2-eb08-db03-689f-db4442b0e872@Oracle.com>
Date: Wed, 29 Apr 2020 19:11:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200429143238.10115-1-tzimmermann@suse.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9606
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004290177
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9606
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 priorityscore=1501
 mlxlogscore=999 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290177
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
Cc: John Donnelly <john.p.donnelly@Oracle.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/29/20 9:32 AM, Thomas Zimmermann wrote:
> This patchset converts mgag200 to atomic modesetting. It uses simple
> KMS helpers and SHMEM.
> 
> Patches 1 to 4 simplifies the driver before the conversion. For example,
> the HW cursor is not usable with the way universal planes work. A few
> data structures can be cleaned up.
> 
> Patches 5 to 15 untangle the existing modesetting code into smaller
> functions. Specifically, mode setting and plane updates are being
> separated from each other.
> 
> Patch 16 converts mgag200 to simple KMS helpers and enables atomic
> mode setting.
> 
> As some HW seems to require a framebuffer offset of 0 within the video
> memory, it does not work with atomic modesetting. Atomically switching
> plane framebuffers, requires either source or target buffer to be located
> at a non-0 offet. To resolve this problem, patch 17 converts mgag200 from
> VRAM helpers to SHMEM helpers. During plane updates, the content of the
> SHMEM BO is memcpy'd to VRAM. From my subjective obersation, performance
> is not nuch different from the original code.
> 
> The patchset has been tested on MGA G200EH hardware.
> 
> Thomas Zimmermann (17):
>    drm/mgag200: Remove HW cursor
>    drm/mgag200: Remove unused fields from struct mga_device
>    drm/mgag200: Embed connector instance in struct mga_device
>    drm/mgag200: Use managed mode-config initialization
>    drm/mgag200: Clean up mga_set_start_address()
>    drm/mgag200: Clean up mga_crtc_do_set_base()
>    drm/mgag200: Move mode-setting code into separate helper function
>    drm/mgag200: Split MISC register update into PLL selection, SYNC and
>      I/O
>    drm/mgag200: Update mode registers after plane registers
>    drm/mgag200: Set pitch in a separate helper function
>    drm/mgag200: Set primary plane's format in separate helper function
>    drm/mgag200: Move TAGFIFO reset into separate function
>    drm/mgag200: Move hiprilvl setting into separate functions
>    drm/mgag200: Move register initialization into separate function
>    drm/mgag200: Remove waiting from DPMS code
>    drm/mgag200: Convert to simple KMS helper
>    drm/mgag200: Replace VRAM helpers with SHMEM helpers
> 
>   drivers/gpu/drm/mgag200/Kconfig          |   4 +-
>   drivers/gpu/drm/mgag200/Makefile         |   2 +-
>   drivers/gpu/drm/mgag200/mgag200_cursor.c | 319 --------
>   drivers/gpu/drm/mgag200/mgag200_drv.c    |  51 +-
>   drivers/gpu/drm/mgag200/mgag200_drv.h    |  43 +-
>   drivers/gpu/drm/mgag200/mgag200_main.c   |  28 -
>   drivers/gpu/drm/mgag200/mgag200_mode.c   | 948 ++++++++++++-----------
>   drivers/gpu/drm/mgag200/mgag200_reg.h    |   5 +-
>   drivers/gpu/drm/mgag200/mgag200_ttm.c    |  35 +-
>   9 files changed, 563 insertions(+), 872 deletions(-)
>   delete mode 100644 drivers/gpu/drm/mgag200/mgag200_cursor.c
> 
> --
> 2.26.0
> 


  Hi Thomas ,

  I would like to test this on hardware that uses this device integrated 
into as BMC  ( iLo ) that I have ran into problems before. Can you post 
your staging URL so I can clone it ?


( Thank you for CC'ing me. I removed my email from on dlist recently) .




-- 
Thank You,
John
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
