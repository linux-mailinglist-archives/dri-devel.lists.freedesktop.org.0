Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DABC977BD2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 11:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE6510ECCC;
	Fri, 13 Sep 2024 09:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RK3++ilJ";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="THQXwh+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 895 seconds by postgrey-1.36 at gabe;
 Fri, 13 Sep 2024 09:06:57 UTC
Received: from a7-51.smtp-out.eu-west-1.amazonses.com
 (a7-51.smtp-out.eu-west-1.amazonses.com [54.240.7.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4451C10ECCC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 09:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726217520;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=g6maka/lKgrwuWshcXJ3wPSbNiIvhMNMu/RgWlAcypo=;
 b=RK3++ilJRkktb3Wr4L+vRqVkPE0i2mP7JMHgexEXVVqPGcipm7/VG3tp+ZBJ9slK
 hASj1+/Hh7DyXBPQuqVrjfZRw+P8uLAoCht9KRozO+q5bvYnJfKRPrxPY2km0UNBe5D
 Gw4EiMotUftRE/f1GZfVP5S4WAXG+XRl34IlHe8nT1olyoFyBLssvJJA/R8hFLw65VU
 JRQNOnYd9CdS9KyHqMggJ9uRRhDCZUvrK/b2ljHlwhqw+SQqXYL7gYh+vQkbWLORBQk
 1d1X+dZuFiwqi6P/RXyexT0GcTijrn6WrMcAFvVADBbY+PTTfOntbB8sEFSd+pKoLNf
 0dY9KaS5Ag==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726217520;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=g6maka/lKgrwuWshcXJ3wPSbNiIvhMNMu/RgWlAcypo=;
 b=THQXwh+6Z1DNX7+fm/6JLN0tS3OeLvi8mSx02cnP4AT73FZmaK1N5sHvWIDmxcSm
 Jb3bmYPmYG4+JsYsmY0vHuxZKpmej8oQIoxi0EMhii60Ewhimhsuu8cfYohHKrGR+jR
 fOb2OUtNd7rEfmSa3YGqc8Rw5Sj6k0f/s1O13108=
Message-ID: <01020191ea950641-b277d24e-52ee-4699-a074-8604bbd09021-000000@eu-west-1.amazonses.com>
Date: Fri, 13 Sep 2024 08:52:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>, 
 matthias.bgg@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com>
 <20240913031505.372868-3-cengjianeng@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240913031505.372868-3-cengjianeng@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.13-54.240.7.51
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

Il 13/09/24 05:15, Jianeng Ceng ha scritto:
> MT8186 ponyta, known as huaqin custom label, is a

MT8186 Ponyta is a Huaqin board based on the Corsola board design with the
addition of (optional??) LTE connectivity through (usb? pcie? what?) integrated
module.

> MT8186 based laptop. It is based on the "corsola" design.
> It includes LTE, touchpad combinations.
> 
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>

After clarifying the commit description like suggested,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


