Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 619B66C45EB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEDB10E3D9;
	Wed, 22 Mar 2023 09:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D003110E3D9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:14:25 +0000 (UTC)
Received: from booty (unknown [37.160.6.101])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 711B5C0003;
 Wed, 22 Mar 2023 09:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1679476463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=deGf4hUAwHy3aFmh+GEX0MrCG/Z4A2oTIyUdBJkliMk=;
 b=FcUqVMG0jy2j8wsgIutB3P8OM24PcNQNWBz/Oz16g8RToD5DJEy5rdWd6kKMp2GZdUfq+h
 xUu+Wf9ibxwbvZaUvUSlT9NOQ1KANWdSurt9yPw+uB1IH2iQo/zvJr1Ko8BDW7Owe/vD3x
 Oei1F7LKlH6GrTB1h6GRyiNcllzYXPfjtaiYgEpL5i3Gmo9NbNNxY2uSdJ+DKNtK8BPsjq
 Y5T3ND3mtKcyIfygf8QnqSEU7Ngc+sGqOICeS5J+uSEJ6/6qrX8Dzn4tIXVWJ5MXIwg4BR
 Y3ZCQgLKRiSrn5CZ2oSjXWhVhlmG3RptxTrPyQ4BnSmZD14Y3s2C97Opga6VCA==
Date: Wed, 22 Mar 2023 10:14:17 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [RESEND PATCH v4 00/21] Add Tegra20 parallel video input capture
Message-ID: <20230322101417.4561a7ae@booty>
In-Reply-To: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
References: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Thu,  9 Mar 2023 15:42:59 +0100
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> TL;DR: Resending this series with Rob's review tag added. Now all DT
> patches have at least a reviewed-by tag from Rob or Krzysztof, all the
> driver patches have one from Dmitry.

This is a gentle ping about this series. All patches have a
reviewed-by, there are no major changes since v2, and it's touching a
staging driver anyway.

I don't think there is more I can do at the moment besides pinging, but
should there be anything, I'd be glad to know! :-)

Best regards,
Luca
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
