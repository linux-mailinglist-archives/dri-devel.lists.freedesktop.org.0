Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C9A43C4FB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 10:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B117D89CA1;
	Wed, 27 Oct 2021 08:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ixit.cz [94.230.151.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773FA89C13;
 Wed, 27 Oct 2021 08:22:41 +0000 (UTC)
Received: from [192.168.1.138] (ip-89-176-96-70.net.upcbroadband.cz
 [89.176.96.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 9035720064;
 Wed, 27 Oct 2021 10:22:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1635322956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hSWxFx5H3u7VkFxWrskfDzG37Qm/SgrsmKEi2GSvllg=;
 b=tdq+tPMYciG8TbHbeeFjH8BrtqjBswRKJe9zDbjF3pMsPdTrndWT0foAd4ApVprRkwpMaY
 m8k1+AhAwC/UjibgHgjAjtL3hTuYP0nmvVTyuD5nJhBPUNiyUEdllCbnGNcSqDAesoUQvd
 c08yO/Xry+4rm1l/vZ3SCqL/FNfCpDs=
Date: Wed, 27 Oct 2021 10:22:29 +0200
From: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v6] dt-bindings: drm/msm/gpu: convert to YAML
To: Rob Clark <robdclark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 ~okias/devicetree@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, David Airlie
 <airlied@linux.ie>
Message-Id: <H9NM1R.O70ALO0PAFVF@ixit.cz>
In-Reply-To: <YW17J03XTvJgfBfj@robh.at.kernel.org>
References: <20211017144350.70295-1-david@ixit.cz>
 <YW17J03XTvJgfBfj@robh.at.kernel.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hello Rob,

can this patch can go in?

Thank you
David


On Mon, Oct 18 2021 at 08:48:23 -0500, Rob Herring <robh@kernel.org> 
wrote:
> On Sun, 17 Oct 2021 16:43:50 +0200, David Heidelberg wrote:
>>  Conversion of text binding for Adreno GPU to the YAML format.
>> 
>>  Signed-off-by: David Heidelberg <david@ixit.cz>
>>  ---
>>  v2:
>>    - added compatbile description from Rob Clark
>>    - dropped reg description
>>    - reg numbers increased to 3 (since we also have uncommon cx_dbgc)
>>    - specified interconnect-names items range
>>    - defined zap-shader as an object and added it's properties
>>    - enforce 0 clocks for Andreno >= 6xx since it's defined in GMU 
>> node
>> 
>>  v3:
>>   - fix patterns (add backslash before dot)
>>   - add additional clocks
>>   - adreno@ -> gpu@
>>   - add few const and change enum to anyOf
>>   - added clock & clock-names placeholder in non-conditional part
>>   (description)
>> 
>>  v4:
>>   - clock & clock-names - true,false instead maxItems
>>   - impl. #stream-id-cells, nvmem-cell-names, nvmem-cells
>>   - dropped requirement on firmware-name in zap_shader
>> 
>>  v5:
>>   - maxOtems -> maxItems typo fix
>> 
>>  v6:
>>   - enum -> const to fix ordering
>>   - opp-table is object
>>   - spacing
>>   - drop undocumented and unused #stream-id-cells
>> 
>>   .../devicetree/bindings/display/msm/gpu.txt   | 157 ----------
>>   .../devicetree/bindings/display/msm/gpu.yaml  | 288 
>> ++++++++++++++++++
>>   2 files changed, 288 insertions(+), 157 deletions(-)
>>   delete mode 100644 
>> Documentation/devicetree/bindings/display/msm/gpu.txt
>>   create mode 100644 
>> Documentation/devicetree/bindings/display/msm/gpu.yaml
>> 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>


