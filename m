Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE738720B1F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 23:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E312C10E0F0;
	Fri,  2 Jun 2023 21:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B0910E0F0
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 21:44:09 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 604EEA04F6;
 Fri,  2 Jun 2023 23:44:06 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix03.mail.de (Postfix) with ESMTP id 3DE93801C7;
 Fri,  2 Jun 2023 23:44:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.de;
 s=mailde202009; t=1685742246;
 bh=qb136genN4uMK+cMlGTNXwp8CIpsaNX94p39yze7ehY=;
 h=Message-ID:Date:Subject:From:To:Cc:From:To:CC:Subject:Reply-To;
 b=pA6qa69KmOf1sEFksOXDYlk/WFskPoQWUOANBtfqc4aN6xyhhnwbO78QfBctYRV0F
 qWX/7HwVaFu6Kg4F1K7sKZW0/gS3H5CZtBG8A/+HfU+He57m5oTh8BnQAHE1Ty4t4+
 vhSb/oQhDDNwNQzoJdJ7Thr7HK+LpyzzL2T2NfhE4CHRO0chDiRd3sPCTTKawpkbRQ
 UB7oKdBNQrnJqRqqHuCuu7ydHgxUgf1LqWf6bbnluEMfqJX8m2dMhd085SM0VRDRoD
 mvI8DBp+4XsYwZWp8F14+EmoJbhqDAWCwtBs+C/V+xEd1ZumtHxTdSMYHWmMt5IqtT
 QVpYPwah0iroA==
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id 3BCC3C003E;
 Fri,  2 Jun 2023 23:44:05 +0200 (CEST)
Message-ID: <23f365a8-e079-302f-ad83-de0f83a64051@my.mail.de>
Date: Fri, 2 Jun 2023 23:44:04 +0200
MIME-Version: 1.0
Subject: Re: Kernel bug related to drivers/gpu/drm/ttm/ttm_bo.c
From: Christopher Klooz <py0xc3@my.mail.de>
To: christian.koenig@amd.com, ray.huang@amd.com
References: <69d51cd5-732f-9dc5-4e12-d68990132c85@my.mail.de>
 <fa05fd05-adea-8652-31fd-b48cc90f84cb@my.mail.de>
Content-Language: en-US
In-Reply-To: <fa05fd05-adea-8652-31fd-b48cc90f84cb@my.mail.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 599
X-purgate-ID: 154282::1685742246-1FFFBC09-FB4086B7/0/0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two further bug reports, which could be the same bug:

https://bugzilla.redhat.com/show_bug.cgi?id=2012882 -> it was closed by 
the reporter with the assumption that the issue disappeared on 6.0.5 
because he had no longer occurrences. It also relates to 
drivers/gpu/drm/ttm/ttm_bo.c and looks comparable to some of my earlier 
logs.

https://bugzilla.redhat.com/show_bug.cgi?id=1985880 -> closed due to the 
end of the Fedora-34 release cycle. It is unknown if the reporter still 
experiences the problem. Also relating to drivers/gpu/drm/ttm/ttm_bo.c 
and looking comparable to mine.
