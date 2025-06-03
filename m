Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B38DACCAF5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 18:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E591510E5F8;
	Tue,  3 Jun 2025 16:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Wtb8z3Gd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C3910E659
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 16:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1748966937; x=1749571737; i=deller@gmx.de;
 bh=rxildqnSY26J+3wf2Ha64v4/RndEOK9hP9BYF1bPJs0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Wtb8z3GdjoX+RszqbwNAOWnK/fAlR2W4kayCQI8N1ZNOVvn0xAFRU2tJSxQpO/cT
 EWMuuOKAXa3TS7iJAhzUuPT7S/3ht+Q48AcTl7GXQkSgb/lM4uMIFPqyLgjofgc6n
 duHDK39sufQLcee0DerLMX0PdwErWfqNybrwDwcJjh+TQWXpgLWRZv74PrD+lk1Xh
 ElxxiHSMNA0OIz5AbcCCXw7zbP5meoCxTiAOri1pB3waSVIjEdvs0gk+Ll9jeYT9+
 NbJI0/4uP2KPlwZuDU/1aCiTLa58kndiakehJyHG0hX8LoHe3ab3mglpQirHVSZOq
 /1dVz3uBtvw8ZeASyg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjjCF-1uk1Rr3dD1-00n65x; Tue, 03
 Jun 2025 18:08:56 +0200
Message-ID: <4e3f9936-0d0f-4e93-888f-738daa345905@gmx.de>
Date: Tue, 3 Jun 2025 18:08:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] video: Make global edid_info depend on
 CONFIG_FIRMWARE_EDID
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20250602075537.137759-1-tzimmermann@suse.de>
 <20250602075537.137759-3-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250602075537.137759-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y/dsC9J2KwaH6yr3nRwhfDEYtWjJt5xu7uYYKB552u1PjZ3sHd1
 buPnoOSxOjumbuh3dNvbR5+uhCDe+Xv81+bcrvt+vPwCSd3V9cYgLjd/lyKGet8sAll04n8
 mtMoJQmqaI9mBznOVCAHYGcGaY+c2zwMPTai0DjONLHKLtqp8ZEVVevQLTsdpW/z6IQRyxn
 JGTCaDfNzjZMHltjjUbsQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+oyf6SlNT6o=;d75hgdZzhZhhZbh+ti+2s3DLRy0
 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
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/2/25 09:51, Thomas Zimmermann wrote:
> Protect global edid_info behind CONFIG_FIRMWARE_EDID and remove
> the config tests for CONFIG_X86. Makes edid_info available iff
> its option has been enabled.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   arch/x86/kernel/setup.c         | 4 ++++
>   drivers/gpu/drm/sysfb/efidrm.c  | 2 +-
>   drivers/gpu/drm/sysfb/vesadrm.c | 2 +-
>   include/video/edid.h            | 3 ++-
>   4 files changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Helge Deller <deller@gmx.de>

