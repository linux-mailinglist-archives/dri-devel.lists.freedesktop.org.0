Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFDE1C4E87
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E046E50B;
	Tue,  5 May 2020 06:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 15973 seconds by postgrey-1.36 at gabe;
 Tue, 05 May 2020 01:07:55 UTC
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8BD89D73
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 01:07:55 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 044KXkol121549;
 Mon, 4 May 2020 20:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=1k8NER32mveKFZ/LdwiKhvoxR32lIaD4pc5iGCc1KfM=;
 b=BGi1o+PmyevBnyjwBpt+WnIo8EC/oTslS+U3VsCSopHo51cDlPHO8VtrXunFGTUfYbJ+
 R+obgTmOyFqp+D9b2Q5TGcn8nEb+5NtcikHF5U7lWRHm272sGfOHv9g5LtoEa1UyjW77
 7EatfbyWxfZUEuzQgT2Ku/VfczX9/2I5sWrtgsLhyWHaHxP1SYDS5pkGYIOBL4RaJEH/
 OkaAEMgg4JiI6aAuuH7X9ZNeImySWd+0sGdm2K9iH4EFQMsbxN2u3sbG2gxkmcKeXmgP
 VjPUXqblWiQ8FlT8Xio6/Zpj6iTeSswTrDGAmvpuMLfd5ZM+ItAswnAvmcyXXzGyObII NA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 30s09r1a0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 May 2020 20:41:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 044KaoeM134428;
 Mon, 4 May 2020 20:39:40 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 30sjdrbn0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 May 2020 20:39:39 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 044KdXTh030584;
 Mon, 4 May 2020 20:39:33 GMT
Received: from dhcp-10-154-151-51.vpn.oracle.com (/10.154.151.51)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 04 May 2020 13:39:33 -0700
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: [PATCH 00/17] drm/mgag200: Convert to atomic modesetting
From: John Donnelly <john.p.donnelly@oracle.com>
In-Reply-To: <aa14e291-5ddf-bd02-ceb7-5cb291a20858@suse.de>
Date: Mon, 4 May 2020 15:39:31 -0500
Message-Id: <78327AA5-A1F8-48CA-B69C-E8BDB24A734C@oracle.com>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <793986e2-eb08-db03-689f-db4442b0e872@Oracle.com>
 <aa14e291-5ddf-bd02-ceb7-5cb291a20858@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9611
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005040160
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9611
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005040160
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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



 Got it . Thank you . 


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
