Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F7A17C796
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 22:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F9D6E507;
	Fri,  6 Mar 2020 21:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDD66E507
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 21:09:03 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r7so3968119wro.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 13:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:mime-version
 :content-disposition;
 bh=26Sq85vpjRSteJm5jvInxBanL+YHiCYPey00VEQD8F8=;
 b=cLRtfxoZGwd49oQ/cSgBBxapBQC8Ed31LFCvLKWWm4zURoL5NCgL9T6gXU3O/YLX9b
 bu2ClVKTMWAagnJmjZ8UVHBajmkrZ6AOI/4D6UohQnUw8oAacXTpoKIADxsE993noHXC
 T7RZFsQ8UvKvgFY4lOe9GS/lvqoZMbcrzc3mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:mime-version:content-disposition;
 bh=26Sq85vpjRSteJm5jvInxBanL+YHiCYPey00VEQD8F8=;
 b=FJDqH0kKWXmKmNsjQJQ2aUsQ3GuUGs/9lQ+XRWyM1gr4CpO9xZyZlPkSQbqYV4E8Jg
 JW0Of5ae0t6ksLm6xFAMDLw8Tqdd1ZCAC09AkDf/8YJumKczKWRu3L03Tb1RvV002DBf
 aimwKFXdy4uCM98SHkhjln7cUsHaZp6YMcnr697K6tgmru01RlR8R3xkFch9K6oK8K7A
 rvnrBg+dyib5xZzR6yi3NcONjUW79EdRNPokcZqL48ucimYnhs9BzbobAZvwluMPopkP
 OuHTeJb5ZAP+3ubv2cJvZc4/dVe4izmd9yATzH757fBKZzy2uAYttN/KhvOq/WbMgqT4
 73gg==
X-Gm-Message-State: ANhLgQ3myglgydwpy8zDOwxt8sRymIxu8723V2g//iAfsP7AE92NxBpD
 Mwk6rSSrTiYet8egUDy/GMSD5w==
X-Google-Smtp-Source: ADFU+vsACGhb6mJONDejOXhmARY5fMWATKiKJGT1hnE1V39dTnC/f5B9Nuv19LJ5/6zOD+TOq1plsw==
X-Received: by 2002:adf:ec45:: with SMTP id w5mr5661870wrn.230.1583528941542; 
 Fri, 06 Mar 2020 13:09:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o16sm35619867wrj.5.2020.03.06.13.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 13:09:00 -0800 (PST)
Date: Fri, 6 Mar 2020 22:08:54 +0100
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] drm-fixes
Message-ID: <20200306210854.GA638432@phenom.ffwll.local>
Mail-Followup-To: Dave Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Here's the pull for the lone vgacon fix that we discussed. I added a short
explanation to the commit message where the overflow safety check is.

drm-fixes-2020-03-06-1:
one vgacon input check for stable

Cheers, Daniel

The following changes since commit 2ac4853e295bba53209917e14af701c45c99ce04:

  Merge tag 'amd-drm-fixes-5.6-2020-03-05' of git://people.freedesktop.org/~agd5f/linux into drm-fixes (2020-03-06 11:06:33 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-03-06-1

for you to fetch changes up to 513dc792d6060d5ef572e43852683097a8420f56:

  vgacon: Fix a UAF in vgacon_invert_region (2020-03-06 21:06:34 +0100)

----------------------------------------------------------------
one vgacon input check for stable

----------------------------------------------------------------
Zhang Xiaoxu (1):
      vgacon: Fix a UAF in vgacon_invert_region

 drivers/video/console/vgacon.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
