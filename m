Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C70992139
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 22:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0595910E068;
	Sun,  6 Oct 2024 20:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.b="uGv1jT1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from st43p00im-zteg10072001.me.com (st43p00im-zteg10072001.me.com
 [17.58.63.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6C310E068
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 20:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1728247197; bh=dYh5mzcFJXRf3wk6w3WtIRm8iKhJuRkBoV9itkg3l7w=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=uGv1jT1gswOdoroGU/sHPuHjcSE39zOViJ3eHssRWl/825aY86TsX57lA3x6yG7Zw
 8vOZAb2wQ1g4kQqsoOm/GVC1NuVYNyQSK7HRAiDNwmOiRYdagowrmC4ahQrxL3GeG0
 CcwGWonBwyIoNljksHOec9Y4sEP8UizcEycOfEDgj0od/9lSsdK2j37ByF7t7mK8nj
 ycXypb3q63cFtjZGbwO5lbWSHUSbvbk/FKnGVlhX28V6oOisU02lsse2Yo+Ynl8NB3
 cARwVtgsHEHY1WEugROT2FsXroy7AD1N/+qQAVQscneqefX67qgDpYmPMPVg4QJVBO
 RG+dutfwu4yIw==
Received: from macminiubuntu (st43p00im-dlb-asmtp-mailmevip.me.com
 [17.42.251.41])
 by st43p00im-zteg10072001.me.com (Postfix) with ESMTPSA id ABA31120D85;
 Sun,  6 Oct 2024 20:39:55 +0000 (UTC)
Date: Sun, 6 Oct 2024 20:39:53 +0000
From: Alain Volmat <avolmat@me.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: mali-utgard: Add ST sti compatible
Message-ID: <ZwL1meNjsfVnvaSd@macminiubuntu>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241005-sti-gpu-v1-0-9bc11100b54b@me.com>
 <20241005-sti-gpu-v1-1-9bc11100b54b@me.com>
 <t6ueaovdm5gfqmdsedm4aaz7zabsf5lcx3jpintfwyx26uokup@2qhaqycrj2sl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <t6ueaovdm5gfqmdsedm4aaz7zabsf5lcx3jpintfwyx26uokup@2qhaqycrj2sl>
X-Proofpoint-GUID: E97Q7bmpmpGeWLKav0lTflDrrstAp0p6
X-Proofpoint-ORIG-GUID: E97Q7bmpmpGeWLKav0lTflDrrstAp0p6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-06_19,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=740
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2410060148
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

Hi Krzysztof,

On Sun, Oct 06, 2024 at 02:45:43PM +0200, Krzysztof Kozlowski wrote:
> On Sat, Oct 05, 2024 at 06:07:59PM +0000, Alain Volmat wrote:
> > ST STi SoC family (stih410, stih418) has a Mali400.
> > Add a compatible for it.
> > 
> > Signed-off-by: Alain Volmat <avolmat@me.com>
> > ---
> >  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
> > index abd4aa335fbcebafc9164bd4963f9db60f0450c4..97a7ef0fea1a10df0ff485b9eb4468f44c92da39 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
> > @@ -33,6 +33,7 @@ properties:
> >                - rockchip,rk3188-mali
> >                - rockchip,rk3228-mali
> >                - samsung,exynos4210-mali
> > +              - st,sti-mali
> 
> That's quite generic compatible. I would expect here per-soc.

Ok, right, I change this into st,stih410-mali in a v2.

Thanks,
Alain
> 
> Best regards,
> Krzysztof
> 
