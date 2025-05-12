Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E028AB47EE
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 01:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD6810E1D2;
	Mon, 12 May 2025 23:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=att.net header.i=@att.net header.b="g0EbxXk8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic316-24.consmr.mail.ne1.yahoo.com
 (sonic316-24.consmr.mail.ne1.yahoo.com [66.163.187.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CB210E4A1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 20:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1747080460; bh=1N/T8d74Jx+NCpWrd0FKqkJSTab0kL3ts0D27zynN0Q=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From:Subject:Reply-To;
 b=g0EbxXk8UB4Ss62FNDWPCEa+x2y0QSDFm4T8X9bYnXYaO2MP9+s2AkhYtBLmhd/2z4roqrHQpFklztRZI4+WN3RJYWrWdl14LATsH0XD4aZBDIon6sSeS4rNa3mO4EiWYdgTe8hgeEd2NLX0/hvST2QEKUYxxJYB2AxD6Puggbw=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1747080460; bh=Z66IBuW9+VKRQ+onHevfzUgDKNKwdfUBjLurPvUrQrN=;
 h=X-Sonic-MF:Date:From:Subject:To:From:Subject;
 b=TQMgGu/kWSomrnzBHAQM+mt8+lWAJTUqpo83ZIdzb8XzjBRIAYUHzf6PXoRHD381KJ+2tUrhLrmkyOsoAHCWM4kFifj4ZvXJqlKH4rC6AI9Z9Hgt70nmD8ouusGPRuO2v10c56fhgf8AVycuhodlBT/X4kLJMfIBh3Tx2OCZ+8xorS/9k55cVZsCCqF/SN3OfTayGwQX204LlONR8y3OdiIZ7TDloonYOyyZOPhqgQ5Hud9WrVgEr9l5Px5+dIFTEU7NbMVjFVKuYiWU2vir5a2lkS7aIKv/J2s+D5IY4Y519wEGM1A4bsXnv6gO0XNNa0EqtChQsM7BSLzzhv61iA==
X-YMail-OSG: SfGStR8VM1kcdjK0BQU9ABoNtJ51dRs8HhVOzF8JkfiHvJZqgzO4msousYo8cl6
 sOmFx4rQl5ukpuDqJFfm3ggY4hPNiubLOLRtGLZdmoHeRDz2NUZdUfkAgpwXcqzv52dVkQug9tCp
 IBCCQ_I3_C6e0OHpiIyInC8TQ_0uOsftFqz8ifLaz6HtfmnxY9PW_xyfbXky2PN6C6WVD5fuCNUX
 jBZI7Mv9L1MnnKKLOGwggdPkerpaF20S0pSSXZbG.XcH.wUryjLrBR.TSvUzE1d7FkFeUQ.Qchpl
 wyxhEWc2888iatYUnHTxhFnxWUtwl.sBKrxD0ZFXMUYf6gDSGYO6NbzymhrgDRDsLPtJRVviw4es
 Pm29TBnc2nRbRSvThSJDKe8I8QYzRrKjxTORwnNJbp0oRcm4LkPGNZPgdZRJHKS6Go0_SEXUisNA
 8zKA18tDFcRzxT2yoXYfa_YiCU_2AMckD8Rv9KTl9Hay7RhfFgO1WtzpABE3xuhFb_pV9o3nw69c
 z7SBswJiUbBxRX84LhTbOFQfXMX6qHA_sqfSYOqF4Np.3no8f6Ve1oaAaA8gjSFP.a3wJMRYIlmB
 qY8Jf4pDN8aljNO7zkbSkWB4_zsiXmat8gihUQT1QwilWQw.4RlQWikoSaTl_QpMco9KqHiojOU7
 1_ePff.O0kIzLkQ1Wmev3fMM.tjcdUafEF7jzdmBOguD_qwS4QaWSmKn9TjxfKi06zHjRdr7r3ud
 Go_FL4wu0JbhqEQlfsWvCo43Onxq.i3roGKvJ73MBIi1e6kKl8APh_2krSKe3q7ljTE8wNdbkw8.
 Tdwg9NahrVyC9XxFik9qiMJl8fCz8txctf1iZm5hp7xseSuKwlc.MS7dhL2BMFj4r4cp.bhLp1dF
 DWj3gRqTQksLTzD1CcSqcColOR8L.0CxypV3Lj121fdRtL.Iy4k0DAhgtUDx75w2BqJQh5HCcehP
 iF9w_KwmRKiqSArmIhGKNsRAqdQFTYIufKiw2UHuES5zpP_.F.C4sgj2OfxYTu3zOA9heBGfnkX1
 qdVkXrIArkFDpo_5erI8tvKD2xdx7ldTYg9pgm6mi9qW7nNuQdkRiGmSecUWQi_SeyJPB0L7m22I
 Q_2nGn167lfdA1EGpKOZzMpfPu7FXn6zAhA2YE14HG68WbKAYHTWMfssW2FBBWjLMz8zgRsbvcUc
 ItEXdma5NFSgOwOkizabLGde9vHhz4uA0GD2.iYPkv8HEPcZvEPMdfRIoJqSNDqWZ22pdJYZoVyy
 h8OxXJzmU5P9A7Xrr.GTeb8FZ2d6hY6NKmwt7HFqr1OgkSYaidAdgrcJz.XUgYV3oiUT0rIMnrGk
 8qzHrRmXzfwsFwdkwz8vCwNRy3K8YL8Ogcag2fzJjv1wG0cJsHSJkEo9Wz4sb4glU3FNTE.JacTr
 yHSaTdhFXfBsgTTxoLXWrSAVyxffW6B8FGR2B0r1uyOjOW.NWYiDhVZSBCMV7cWNtlowYmdkpUqC
 r6xitKEQu8u.1nL8TdHdGT7AOS5htxikFM7ehqg3442VwIEKZAmt._o7CPOYvgl1uuj3gs8KxEzO
 ZP0nRM4X9bJK0wrMtmDF2oIAz0IbNXgEUZu2bApWRRDtOqD3hFTIYc5EotZAv_nm2RkStTh2GEq9
 2P9HTbDcMqBhYdJhsWeUhPrT68hX_T5wiC.NQdJjmuzAAvuKI.1S4eAiO70U.fsyCRsg_H.h7RzN
 mPO4WpyUDpbnH2BiaRJk.uX7BMcgBUFCvDp1NGmaayRFyzhJ87A.VJ0ou_Colw543d0uBaGA2fqv
 G7vx4Vmv9m.3.NH2eb8VnhBlUcULuWKQIQljodDpJSiUkX2_Vr0YoWDBLf2HqsqnsDCF.ZdWkkCy
 0FRr0txuZibkmEZgzI.lyZ33o90cpWjPCqCIf.IwB73PdxuXH2aE06hCpaurdDl6Jed5X5cGiSz6
 f5b100xLjEgzVEHvzLuCAGT0Zv0ka2MgWT4q_TijAhe0CgGww5pOCAEeIY_aEeqcZZCCqk5GgYcz
 z4XhcLEuazTwXZv3MXfsL21oemBCxzvxmTTCbFfNDYzzPRqXBgoaV5qUvE9O5SMh8hq9eifpHXwM
 CXINkepTCOFMT54hyJgIit3NwtWSISTSZtu9YIculSL3EyqjEzRDSXtQaE17_B5ODh0QERK4OEaH
 L_VI3j_xEBIRFc5Vbdyveyix5Rw2HTcNvpXG0Ir0NtF0PlcHc72kXoHlAuAXRcma_LTutYmnUm2T
 Ct_oiuIigoBYWsj7BOkH9zdi6VZL4AmJt2SqRCRyt26I-
X-Sonic-MF: <pheonix.sja@att.net>
X-Sonic-ID: 4f4440cb-6ae0-401d-ab8d-fc5f8ee83129
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.ne1.yahoo.com with HTTP; Mon, 12 May 2025 20:07:40 +0000
Received: by hermes--production-bf1-689c4795f-g78fx (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 4a4ca3ada7a93e68209359edaa6dc896; 
 Mon, 12 May 2025 20:07:34 +0000 (UTC)
Date: Mon, 12 May 2025 16:07:26 -0400
From: Steven J Abner <pheonix.sja@att.net>
Subject: Re: Kernels >= 6.3 disable video output
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-Id: <EWZ5WS.K2DTZM5DEZCL2@att.net>
In-Reply-To: <1Q10WS.BHBZBX486I3M2@att.net>
References: <6DWYVS.BXJ4YUZ0KN5B3.ref@att.net> <6DWYVS.BXJ4YUZ0KN5B3@att.net>
 <CADnq5_Pk41iOvibFSjt7+Wjj=FXWR--XMt+OCqmkWWveLfU_ig@mail.gmail.com>
 <GXXZVS.Q1GIIU1M9VBL1@att.net>
 <CADnq5_NvoPfgTxOxjBCc-iGR7k8w7oR7VKkXQtWga8VP7vBViQ@mail.gmail.com>
 <1Q10WS.BHBZBX486I3M2@att.net>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Mailman-Approved-At: Mon, 12 May 2025 23:33:49 +0000
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

On Fri, May 9 2025 at 03:01:13 PM +0000, Steven J Abner 
<pheonix.sja@att.net> wrote:
> On Fri, May 9 2025 at 02:05:16 PM +0000, Alex Deucher 
> <alexdeucher@gmail.com> wrote:
>> bisect between 6.2.16 and 6.2.17 to identify the commit which broke
> 
> Are you asking for a 'diff' output of drm and amdgpu directories 
> between 6.2.16 (last of the 6.2 series) and 6.3 (start of the 6.3 
> series)?

 I'm willing to revert/test code on my machine, problem is I don't know 
sequence nor what I can safely revert. I haven't messed with video 
drivers/code since DOS days of having to write ones own graphics 
routines. I could force? kernel to build with '-g' on drm/amdgpu? and 
walk it I guess. But don't know what I'm looking for. :(
Steve


