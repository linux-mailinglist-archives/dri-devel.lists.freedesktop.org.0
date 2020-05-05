Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A38321C69AB
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B35E6E497;
	Wed,  6 May 2020 07:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D846E21E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 12:20:25 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 045CJLd1148552;
 Tue, 5 May 2020 12:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=l6Hovj0frqbndClOojkWvSLrtSIeQ1ZkVqYnLI65NLM=;
 b=inoc/0jleiTS50+G3DyhVY4HcIqQelWxZlKB95HBmeer6rDtNjxvysg7rSVAe9BsB0UD
 S4+pB/p+HGa2U5H/Qmzv3SKlT7gDeuZrnNavSDfz2bE7RgGbeYwLmKiNaLqLALjUuxJt
 UWiwO9rpfhAB1M4rfTdcSbiK7Bp3V2gvWpILKY7zyBjKeSp9aDykfJuUhsvUzde+6Jzk
 O2KzqxgrX5IJXAJJXlixbj6BapLMEtuDP+5Bezw+RvzPhfd2ZsEsfxR8VwnKeciMA7YX
 oYjJj/bRe1cKENjmRNd2vx3uB2mmI6DmLGWfAA9GJA8TmZ8n26+io4jb8ZSOJsp1a6dr SA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 30s0tmcaaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 May 2020 12:20:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 045CCdNN093841;
 Tue, 5 May 2020 12:20:22 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 30sjjyjh3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 May 2020 12:20:22 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 045CKCKv025328;
 Tue, 5 May 2020 12:20:12 GMT
Received: from dhcp-10-154-151-51.vpn.oracle.com (/10.154.151.51)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 May 2020 05:20:12 -0700
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: [PATCH 00/17] drm/mgag200: Convert to atomic modesetting
From: John Donnelly <john.p.donnelly@oracle.com>
In-Reply-To: <aa14e291-5ddf-bd02-ceb7-5cb291a20858@suse.de>
Date: Tue, 5 May 2020 07:20:10 -0500
Message-Id: <8802DE27-AA22-4407-A177-17636FC6740A@oracle.com>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <793986e2-eb08-db03-689f-db4442b0e872@Oracle.com>
 <aa14e291-5ddf-bd02-ceb7-5cb291a20858@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9611
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9611
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005050099
X-Mailman-Approved-At: Wed, 06 May 2020 07:02:40 +0000
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
Cc: dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On May 4, 2020, at 8:39 AM, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> 
> Hi John
> 
> Am 30.04.20 um 02:11 schrieb John Donnelly:
>> On 4/29/20 9:32 AM, Thomas Zimmermann wrote:
>>> This patchset converts mgag200 to atomic modesetting. It uses simple
>>> KMS helpers and SHMEM.
>>> 
>>> Patches 1 to 4 simplifies the driver before the conversion. For example,
>>> the HW cursor is not usable with the way universal planes work. A few
>>> data structures can be cleaned up.
>>> 
>>> Patches 5 to 15 untangle the existing modesetting code into smaller
>>> functions. Specifically, mode setting and plane updates are being
>>> separated from each other.
>>> 
>>> Patch 16 converts mgag200 to simple KMS helpers and enables atomic
>>> mode setting.
>>> 
>>> As some HW seems to require a framebuffer offset of 0 within the video
>>> memory, it does not work with atomic modesetting. Atomically switching
>>> plane framebuffers, requires either source or target buffer to be located
>>> at a non-0 offet. To resolve this problem, patch 17 converts mgag200 from
>>> VRAM helpers to SHMEM helpers. During plane updates, the content of the
>>> SHMEM BO is memcpy'd to VRAM. From my subjective obersation, performance
>>> is not nuch different from the original code.
>>> 
>>> The patchset has been tested on MGA G200EH hardware.
>>> 
>>> Thomas Zimmermann (17):
>>>    drm/mgag200: Remove HW cursor
>>>    drm/mgag200: Remove unused fields from struct mga_device
>>>    drm/mgag200: Embed connector instance in struct mga_device
>>>    drm/mgag200: Use managed mode-config initialization
>>>    drm/mgag200: Clean up mga_set_start_address()
>>>    drm/mgag200: Clean up mga_crtc_do_set_base()
>>>    drm/mgag200: Move mode-setting code into separate helper function
>>>    drm/mgag200: Split MISC register update into PLL selection, SYNC and
>>>      I/O
>>>    drm/mgag200: Update mode registers after plane registers
>>>    drm/mgag200: Set pitch in a separate helper function
>>>    drm/mgag200: Set primary plane's format in separate helper function
>>>    drm/mgag200: Move TAGFIFO reset into separate function
>>>    drm/mgag200: Move hiprilvl setting into separate functions
>>>    drm/mgag200: Move register initialization into separate function
>>>    drm/mgag200: Remove waiting from DPMS code
>>>    drm/mgag200: Convert to simple KMS helper
>>>    drm/mgag200: Replace VRAM helpers with SHMEM helpers
>>> 
>>>   drivers/gpu/drm/mgag200/Kconfig          |   4 +-
>>>   drivers/gpu/drm/mgag200/Makefile         |   2 +-
>>>   drivers/gpu/drm/mgag200/mgag200_cursor.c | 319 --------
>>>   drivers/gpu/drm/mgag200/mgag200_drv.c    |  51 +-
>>>   drivers/gpu/drm/mgag200/mgag200_drv.h    |  43 +-
>>>   drivers/gpu/drm/mgag200/mgag200_main.c   |  28 -
>>>   drivers/gpu/drm/mgag200/mgag200_mode.c   | 948 ++++++++++++-----------
>>>   drivers/gpu/drm/mgag200/mgag200_reg.h    |   5 +-
>>>   drivers/gpu/drm/mgag200/mgag200_ttm.c    |  35 +-
>>>   9 files changed, 563 insertions(+), 872 deletions(-)
>>>   delete mode 100644 drivers/gpu/drm/mgag200/mgag200_cursor.c
>>> 
>>> -- 
>>> 2.26.0
>>> 
>> 
>> 
>>  Hi Thomas ,
>> 
>>  I would like to test this on hardware that uses this device integrated
>> into as BMC  ( iLo ) that I have ran into problems before. Can you post
>> your staging URL so I can clone it ?
> 
> I uploaded the patches at
> 
> 
> https://gitlab.freedesktop.org/tzimmermann/linux/-/tree/mgag200-simplekms-20200504
> 
> You can clone them with
> 
>  git clone git@gitlab.freedesktop.org:tzimmermann/linux.git
> 
> and checkout the mgag200-simplekms-20200405 branch afterwards.
> 
> Best regards
> Thomas
> 
>> 
>> 
>> ( Thank you for CC'ing me. I removed my email from on dlist recently) .
>> 
>> 
>> 

     I had no issues running  these changes with gnome on a server with a mgag200 integrated into a BMC .

    Tested-by:  John Donnelly <John.p.donnelly@oracle.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
