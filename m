Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C4453B8A6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 14:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAE110E4D3;
	Thu,  2 Jun 2022 12:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E1F10E4D3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 12:06:06 +0000 (UTC)
Received: from [192.168.41.62] ([46.114.149.130]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MBDva-1o4x343b2s-00Cli0; Thu, 02 Jun 2022 14:05:57 +0200
Message-ID: <58f02593-7d7d-cc95-8641-c7dd2dceacdb@i2se.com>
Date: Thu, 2 Jun 2022 14:05:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 6/6] arm64: config: Enable DRM_V3D
Content-Language: en-US
To: Peter Robinson <pbrobinson@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 bcm-kernel-feedback-list@broadcom.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>, javierm@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 maxime@cerno.tech, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
References: <20220601110249.569540-1-pbrobinson@gmail.com>
 <20220601110249.569540-7-pbrobinson@gmail.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220601110249.569540-7-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ySVw215QqyzDwqTpADuF4NISRbRI0tgvO+MFFxmmX7Ad2QkZfuq
 CkebJYQzs94RgV6QBCfoKG4LSE/hlm08Mh3IgWU9L3XhWLzWDbO2d5O7c2y8h7lGRzehZlf
 H6pMf9P3J8gg/o5oBYFEYnis7wouWeRo5cOQkOzmf4TJd7O1HAsE/+n4pjEf8lGs/AvdkzH
 kv5NM9WpxU59cCI7p1g/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:llqUEel59Cw=:yoJZMQwtBJKAuWWnwL1POQ
 vACN60q0mffARbSUkEclNtJHwb+ZVkeO+hbsC6nCh0MLDih9iNPzAUDoD114cOvZqLO32iFr5
 2DxBXh97xeAF0cJ5mFm9bJHVtXibAMEfPkwGMDCzTNTsE+Lzyv8XSwqERiVvzzhLe8tJCVOwA
 kydPrOh0DjgXfQTg9O/9+/Tw5ZUnvhZUjXGusthFeshvFTIhZYXRBT4vQBZAuD/YqkEES0rkY
 OsO+iB8fHkg8EZiG8vSZChI52Z7MPiTqK92d1hpeQH2mE5fbxSJehZxYubPsuTxFT7ZrVbG4B
 y0BpctesaYA5c6WzIrtPvJpXyUyBScbMMIpOKl7Nasp95lUGk4AkkWm3qX8CI2okVeMBz+0oW
 NjkTvh0F5D/4xWvDtO1c7v8szb9VVLe1loiusa3a2W/ejpMnq3vZg2H0NsfcsKLjrBkvVHWG0
 fS+sb9V9WPn0AYjn2yAR1CUjnlAken4QDEBaa3Gys7rkIA+20W3fdjE537MdUM4IAkQM6N7Ou
 GioOACtmSP2Is3oEQm0NpByzJZOefz0dtbHUBwvk089oyzjKORTEcjrnonisBQfKgqJa73ORV
 JiE/N/O+yBjy3BRIRx0TcmTbfUNOWfFGLBnLh6Kv5wyMnNgL6xL4CDONFYCogg2mf5K38Mz1f
 oCrBLRFgJ54l1J0wntjJzAi2VyK7m3fhSXF6ZwT3gLhlU8oJM3U6THuT4cGMhNNsusw4I+5A+
 2CmAnD1++KLUKURet836X3ZhJgyWOrk3S87nNvP1il+Asad3tPIyWJ/xQk0=
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
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.06.22 um 13:02 schrieb Peter Robinson:
> From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>
> BCM2711, the SoC used on the Raspberry Pi 4 has a different GPU than its
> predecessors. Enable it.
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
