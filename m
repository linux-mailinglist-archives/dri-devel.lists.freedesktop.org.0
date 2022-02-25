Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D4A4C413C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 10:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49D410E772;
	Fri, 25 Feb 2022 09:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6227210E772
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 09:24:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id EF4A81F45AF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645781062;
 bh=u9idag57rvmc8+kE2xwXHO4QSmwf2cUfuVZYpVWwzno=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HHWrpRKDWWODvpKgHH2FJgoYRczWBTVoDmcsJ+U2u8Xqo6LJt2XZnraOXJYYETihN
 hg3T7TC/JSIXJjq1Z314B3P/rZ/SkucOhzZtf3qRY4kVe6BOebMcswRYwEsD5oKJGb
 SUlO7LNPCnyG/O1XvC9dESgyC1ZcYSXHF1vM0piUlEGYLVFjWub+tOFcqqilkm1CWL
 yqsipCrQwrnh3Icd1weux1eKwl5VO7wKVc1uIhcdfU00QzeoFbT6S3bMGUyCRiOSoD
 QOr0dW+2w6ppmynj2Qhb4dkptB4Sj6YEGP2Lxf2VC6/uj6wVnhObM1FwrS/FG2ziV7
 R2W5gl8OWHw6g==
Message-ID: <5d87e367-4ca8-9f61-bc17-e1998be0ed6c@collabora.com>
Date: Fri, 25 Feb 2022 10:24:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v7, 11/15] media: mtk-vcodec: record capture queue format
 type
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
 <20220223034008.15781-12-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220223034008.15781-12-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/02/22 04:40, Yunfei Dong ha scritto:
> Capture queue format type is difference for different platform,
> need to calculate capture buffer size according to capture queue
> format type in scp.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>


This change is ok, but the commit message should be changed to advertise
that this is preparation for the new stateless H264 decoding driver.
Besides, I suggest to reorder the commits sequence, so that this commit
goes in between "Extract H264 common code" and
"support stateless H.264 decoding for mt8192", as this last one is
the actual real user of this change.


Anyway, this is my commit message proposal:

The capture queue format type may be differ depending on platform:
for stateless decoder drivers, we need to calculate the capture buffer
size according to the capture queue format type in SCP.

As a preparation for introducing drivers for stateless decoding, save
the current capture queue type on a per vcodec context basis.

After fixing,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
