Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC127BC8C9B
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 13:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AE810E9B5;
	Thu,  9 Oct 2025 11:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VRa6RD7Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD2E10E9B5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 11:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760009234;
 bh=Ci7fJTXqo4Z20C2XhPVrLu17OYCK7HuDTL8uZuZ4OA8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VRa6RD7Z4Ol1Fi6WqTpUb4G5Kwx/WEEJvoDj3O7XI7UtRxwsZWqDvZi7rz+8Yi2U1
 74l8i5c1HmW7+/oIF2wwuVu/QkUH9oXcRxE/Sl4YTESoHst3p6/6x+QKOvCzENZkM9
 vaEI06KKa9cZkQ5utMuvB6whcGIWEHeF494dGEtt/Qz4kp37JTpsU0a8eiqIiMr0n+
 E0QV7nmS4cYw3HbxyzuCVpYqC3+h0YNKCD7MxCbCvevMfWnWDZgNr03vFG9PPrsuwr
 J+XsyfNE2DEqTZYSlQF8/UPho0EX4DH4N/l4YtafPp3fEtorvPw0gR00MPOvndUMlU
 9h+U96Rz4XV5g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C15F17E0579;
 Thu,  9 Oct 2025 13:27:13 +0200 (CEST)
Message-ID: <044f8f98-7ae2-45ef-9b9e-a112d7013e5d@collabora.com>
Date: Thu, 9 Oct 2025 13:27:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/20] mailbox: mtk-cmdq: Add GCE hardware
 virtualization configuration
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-7-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-7-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> The GCE hardware virtualization configuration supports the isolation of
> GCE hardware resources across different OS environments. Each OS is
> treated as a virtual machine (VM) for GCE purposes.
> There are 6 VMs and 1 host VM. The host VM has main control over the
> GCE virtualization settings for all VMs.
> 
> To properly access the GCE thread registers, it is necessary to
> configure access permissions for specific GCE threads assigned to
> different VMs.
> Currently, since only the host VM is being used, it is required to
> enable access permissions for all GCE threads for the host VM.
> 
> There are 2 VM configurations:
> 1. VM_ID_MAP
> There are 4 registers to allocate 32 GCE threads across different VMs:
> VM_ID_MAP0 for threads 0-9, VM_ID_MAP1 for threads 10-19,
> VM_ID_MAP2 for threads 20-29, and VM_ID_MAP3 for threads 30-31.
> Each thread has a 3-bit configuration, where setting all bits to 1
> configures the thread for the host VM.
> 
> 2. VM_CPR_GSIZE
> It is used to allocate the CPR SRAM size to each VM. Each VM has 4-bit
> configuration, where setting bit 0-3 to configures the size of host VM.
> This setting must be configured before the VM configuration to prevent
> resource leakage.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


