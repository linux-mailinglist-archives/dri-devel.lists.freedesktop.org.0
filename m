Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78529FD1DA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 09:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E2210E209;
	Fri, 27 Dec 2024 08:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F2ikearV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3830D10E209
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 08:13:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3BF15A41266;
 Fri, 27 Dec 2024 08:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE239C4CED0;
 Fri, 27 Dec 2024 08:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735287225;
 bh=96Hwn3Z+nB6AngNQ+jC51nXEuFyFhKWFheg0DPO7DX4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F2ikearVIQGXVk7OUw6RZwnS3Un4zq4CnVNru13sDprPSxlmuJslono3QqU53AzIi
 iPjyUJQTbTlmqcKxYccWA9sz59f6kTxUWr1U5scoZCYgdQnIC8oyOQ/kLxMIHbxdGe
 Z2CYFJIys6HMhituaJUmBjsaqOj6CA43ciltrxZvFTzycx4SuJoAPSU/c+JiQ3h8da
 w6ZteDNJLbKk49ijJuslQwdm9g3tA5U/kx1Kf4mMD1LFK1j6VS0wvUcySQh0Foi31K
 XD9uAdac2+VkvcLqiqvXCp3mxgOlIRvo8xZm6MIyni7mnLC5eYO3opPXrgF/LxA+pi
 u0WEtVsS19kIQ==
Date: Fri, 27 Dec 2024 09:13:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
 Xavier Chang <xavier.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196
 support for gce-mailbox
Message-ID: <yg7b2iaz53avd7gpvuewhi6b3myh6owls3dt2hzpqc26lnykjf@tpu2vxqqkipe>
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
 <20241219170800.2957-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241219170800.2957-2-jason-jh.lin@mediatek.com>
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

On Fri, Dec 20, 2024 at 01:07:54AM +0800, Jason-JH.Lin wrote:
>    2) GCE Subsys ID:
>    - Defined in the header file: `#define SUBSYS_1c00XXXX 3`
>    - Used in the Device Tree:
>    	`mediatek,gce-client-reg = <&gce SUBSYS_1c00XXXX 0x0000 0x1000>;`
>    - Parsed and used in the driver to configure subsys ID:
>      ```c
>      int cmdq_dev_get_client_reg(struct device *dev,
>      				 struct cmdq_client_reg *client_reg,
>      				 int idx)
>      {
>      	client_reg->subsys = (u8)spec.args[0];
>      	client_reg->offset = (u16)spec.args[1];
>      }
>      // GCE write the value to the register 0x1c000000 + 0x0000 + offset
>      cmdq_pkt_write(cmdq_handle, client_reg->subsys,
>      		    client_reg->offset + offset, value);

This is a proof that SUBSYS_1300XXXX is not a binding. Your driver does
not use it.

Drop all such things which are not used by drivers or explain why they
are needed to be in the binding - what do they bind.

I asked for this already, for exactly the same thing.


I did not check the rest, so next time I will choose any other random
define and if I do not find it explained nor used, I will question it.
Because you tend to apply pieces of review instead of really change your
code.

>      ```

Best regards,
Krzysztof

