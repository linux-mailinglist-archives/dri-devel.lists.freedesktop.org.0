Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948526DBC18
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 18:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9505710E0DA;
	Sat,  8 Apr 2023 16:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A8B10E0DA
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 16:10:40 +0000 (UTC)
Received: from mail.panix.com (localhost [127.0.0.1])
 by mailbackend.panix.com (Postfix) with ESMTPA id 4Pv0Zk40xWz3pXr;
 Sat,  8 Apr 2023 12:10:38 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1680970238; bh=2iUZf5TN6bhjLSuVEYfr0CxofZxrklYy9ca0vsjzZs0=;
 h=In-Reply-To:References:Date:Subject:From:To:Cc;
 b=TzvwiVFWvCZg6rEjjTNrxAWMnWpbjFPEyz8zJ0EL+BC7dOfQpnYwnTtqMkIxWcY/K
 WiVN3XjOdZN2A3Z6o6semY8Ke0ZvFr3oazKs82XOpQaRYJtATcuxdEU9O08to5ADi2
 MIsIDpPlvA/RWPzHH/zPmXTs+YJjvb2nxP31aI6I=
X-Panix-Received: from 166.84.1.1
 (SquirrelMail authenticated user pa@panix.com)
 by mail.panix.com with HTTP; Sat, 8 Apr 2023 12:10:38 -0400
Message-ID: <2ca4fbdb87a335522c22551658576e55.squirrel@mail.panix.com>
In-Reply-To: <4Psm6B6Lqkz1QXM@panix3.panix.com>
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-2-tzimmermann@suse.de>
 <4Psm6B6Lqkz1QXM@panix3.panix.com>
Date: Sat, 8 Apr 2023 12:10:38 -0400
Subject: Re: [PATCH v3 01/13] firmware/sysfb: Fix EFI/VESA format selection
From: "Pierre Asselin" <pa@panix.com>
To: "Pierre Asselin" <pa@panix.com>
User-Agent: SquirrelMail/1.4.23-p1
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
X-Priority: 3 (Normal)
Importance: Normal
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
Cc: Pierre Asselin <pa@panix.com>, javierm@redhat.com, mairacanal@riseup.net,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Oh oh, I just reproduced the problem on a desktop tower, a Dell Precision
T3610, probably 2019 vintage.  The only thing in common with the old
laptop, that I can think of, is that both use the legacy BIOS.  The Dell
has EFI but the graphics card may not support that; there is no integrated
graphics, if I switch to EFI and lose the video I may not be able to switch
back.

Recommend some testing on boxes with legacy BIOS.

--PA

