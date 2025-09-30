Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA51EBAE8C8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 22:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E5110E62E;
	Tue, 30 Sep 2025 20:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="SvJMv1ea";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D08E10E637
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759264518; x=1759869318; i=deller@gmx.de;
 bh=/4NQDtLIBMiD17zjpoxNiq3YuloIyWdg2IivP46km6w=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=SvJMv1eahgHVshVCUC9TxYkkQaE05Fq/L3dQBUior39kjEHhqH96xGoNXhIoR0Py
 EygixQOMHIPziAmWbye2COy3Ltjdas37+ZB0d3Y4tluzKJC1O31n6jNhV8Go2PjdM
 +3ksy3EI6n+j+TZxG7Gj4Z4WS0Ul+/A0PCTm/qul8HNRcU3/YJNHtchOjplHvA3D1
 q7Xwtm2D01ZBzAYOPJgp6Vfzq5jl8p20xJhVHayRv5ZvxTzaZQMQknt8iZwc0PJiF
 Qd9QL1kj6451e3WvbTbhPBBO07Kzq79LB8gn/OyTYq3NRyxR5qsyJV9q4gApc/grK
 P3dDxQYm/TaOn8girg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.4]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNcA-1uUdMc0DHk-00e066; Tue, 30
 Sep 2025 22:35:18 +0200
Message-ID: <a8bf25a0-fb2f-4e35-9a14-f09a530ef0fb@gmx.de>
Date: Tue, 30 Sep 2025 22:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Make drivers depend on LCD_CLASS_DEVICE
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250924083411.165979-1-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250924083411.165979-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iPDAjVfzk4o3tnordyrzQVbjHgfxnqaRGrEN5m0ch3LhBm8eqoZ
 s2eHn+WJEdURhymuTStqv5diWmsPB+TBC2Lu5vRFG44n7XYSvH1xsrbJR6eq4EDCXjcJu7L
 ZD9enomT0vRkPDFHO+y1uNqG6d5xbqtICDlB9L2flnAvYyagVmdGoEEVJ23KbvaybgPBlFv
 xnVdSwgehbMFUenJhumFw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lbl8qDL7tBc=;moMUops1RnaLASxVBIX96HtO92+
 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
 ShnNXHOih0sUtVGndslnIn/+gv0YRiqsfAs=
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

On 9/24/25 10:33, Thomas Zimmermann wrote:
> LCD_CLASS_DEVICE is the user-controlled option that enables the LCD
> display subsystem. Do not select it from fbdev drivers. Selecting it
> from drivers can lead to cyclic dependencies within the config.
>=20
> Some guidelines for using select can be found in the kernel docs at [1].
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://elixir.bootlin.com/linux/v6.16/source/Documentation/kbuild=
/kconfig-language.rst#L147 # [1]
> ---
>   drivers/video/fbdev/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

applied to fbdev.

Thanks!
Helge
