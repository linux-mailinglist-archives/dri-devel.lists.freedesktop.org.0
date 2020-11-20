Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC782BBEBB
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 12:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EAD6E9AF;
	Sat, 21 Nov 2020 11:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A36089C1F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 16:18:00 +0000 (UTC)
Received: from [IPv6:2804:431:e7dc:5975::b93] (unknown
 [IPv6:2804:431:e7dc:5975::b93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1AAD51F46179;
 Fri, 20 Nov 2020 16:17:56 +0000 (GMT)
To: Melissa Wen <melissa.srw@gmail.com>
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: [BUG] drm/vkms: Failure when using drmGetConnectorCurrent()
Message-ID: <d589025b-76b2-1826-1798-60f61000b14a@collabora.com>
Date: Fri, 20 Nov 2020 13:19:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Sat, 21 Nov 2020 11:34:30 +0000
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

We have a patch in Weston to replace drmGetConnector() calls with 
drmGetConnectorCurrent():

https://gitlab.freedesktop.org/wayland/weston/-/issues/437
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/518

Unfortunately this is not working when we use VKMS (upstream version 
tested). Please see

https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/518#note_700345

for more information, and feel free to jump into the discussion. If 
there's more helpful information that I can share, please let me know.

Thank you,
Leandro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
