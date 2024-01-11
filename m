Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B14982B075
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 15:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE7F10E07C;
	Thu, 11 Jan 2024 14:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8897810E07C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 14:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jnQsII4KrVqLz99DGj/AukHG6JKJwMgNV2PckgGWYdg=; b=SQBpbr27dxHFBTogonmMGwYonu
 QHuz6PIiLbZxNYdkpN8KSWVXTR22myfLWa7sqmWa9+94TMmDUJM+nxzceNUmyK6I+xIzJa27y4Uou
 sNYuFGbjGT48LeypqYK0eosXka8RWFGGupEZIia6KZxXNE/mlkbYLlHojlJTRX0h+AOscId6O4nZ1
 dxhnKzxS59I7quKnhg6Vbcci7kdGW4/aQyXTTQyLRXcqLFwjVcBwOe9+H0ugOHsT/FDRWA0lQ6qi4
 UkXVGq5rNaSMRRxAngh3SNxDlE+bLngNuh8Ypfcpb3HYke7zFZQoyuf942f20nrZhcQMRxr9silk9
 FXGSVgnw==;
Received: from [179.234.233.159] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rNvrl-005Q4p-6p; Thu, 11 Jan 2024 15:17:05 +0100
Message-ID: <130478b0-9267-48e5-abe8-2015617508e7@igalia.com>
Date: Thu, 11 Jan 2024 11:16:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vc4: don't check if plane->state->fb == state->fb
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20240105175908.242000-1-mcanal@igalia.com>
 <4a4b24fc85d28f08a9e2f6c84a72f4fa@kernel.org>
From: Maira Canal <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <4a4b24fc85d28f08a9e2f6c84a72f4fa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: kernel-dev@igalia.com, Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/8/24 05:43, Maxime Ripard wrote:
> On Fri, 5 Jan 2024 14:58:36 -0300, Ma=C3=ADra Canal wrote:
>> Currently, when using non-blocking commits, we can see the following
>> kernel warning:
>> =20
>> [  110.908514] ------------[ cut here ]------------
>> [  110.908529] refcount_t: underflow; use-after-free.
>> =20
>> [ ... ]
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>

Pushed to drm-misc/drm-misc-next!

Best Regards,
- Maíra

> 
> Thanks!
> Maxime
