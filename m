Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F9733185
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 14:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A1210E612;
	Fri, 16 Jun 2023 12:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6980D10E612
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:45:13 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25EC3AB;
 Fri, 16 Jun 2023 14:44:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686919479;
 bh=OaUTs1pNl8tcjN/wLLanDbgabdIQzVRUuZtiL15s//E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FAIt915C39boke8VUYI/TIFdf8Y7IDDjbcl/6yaqI3cNzTNaoLnA4LdtDVp9yo/Kb
 3FpOxTNqYNgw2umuspnEXOf+Y7wF3BHlBtO173s81zxb5OAvdgnz233aPksD88jwXe
 nT2mfvM8qmj8CtK3+u19IKLCam9f5VMO2q4hSj4c=
Message-ID: <5eb55b7d-f1e9-0dbe-cbbf-bd27ae521e5f@ideasonboard.com>
Date: Fri, 16 Jun 2023 15:45:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 2/2] drm/tidss: Add support for AM625 DSS
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230608163734.2578-1-a-bhatia1@ti.com>
 <20230608163734.2578-3-a-bhatia1@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230608163734.2578-3-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 08/06/2023 19:37, Aradhya Bhatia wrote:
> Add support for the DSS controller on TI's AM625 SoC in the tidss
> driver.
> 
> The AM625 DSS supports 2 video planes connecting to 2 video ports.
> The first plane is a full plane supporting all the features, while the
> 2nd plane is a "lite" plane without scaling support.

The DRM planes are reversed compared to the HW planes, aren't they? Is 
the above referring to HW planes?

> The first video port in AM625 DSS internally provides DPI output to 2
> OLDI transmitters. Each OLDI TX outputs 4 differential lanes of video
> output and 1 of clock output.

I think it should be explained that OLDI is not supported in this 
version, but will be added later.

Other than that:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

