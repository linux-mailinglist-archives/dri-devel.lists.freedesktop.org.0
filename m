Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CDCAB25AE
	for <lists+dri-devel@lfdr.de>; Sun, 11 May 2025 01:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3986C10E027;
	Sat, 10 May 2025 23:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 406 seconds by postgrey-1.36 at gabe;
 Sat, 10 May 2025 12:10:21 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F192A10E010;
 Sat, 10 May 2025 12:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oldschoolsolutions.biz; s=s1-ionos; t=1746879019; x=1747483819;
 i=jens.glathe@oldschoolsolutions.biz;
 bh=OwyZeqxclZuiANkoRb9+rhejJTcrD9vErRrbOtX25YM=;
 h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
 Subject:To:Cc:References:From:In-Reply-To:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=oN4uec/+hPnYgjc2aR5TRstZ+nIt6WSK8ME1wf03X+V3r+IWK/CISgV6DFM2C4hj
 KBYKhmoIoK9zqCMg7Mu/Pm5CQ1AFco5URmNc2BqA2sw/Nv/r01nbgxqHtwVQe81zh
 xhVEE0I3kV/7CR1GSKJGbRc1CMjj7Se47VpkRaQoqIMpJBI1fUu+UpjWBHsiB1ROL
 LzWmdpBpGOwC3a6P5GdpCkHu2FeYsR62lUuRVZZnSicV2OPnXQ7JHlDxY0DmYKNg7
 Hk7fDZRuoPxhlgQCYMTNrpNJ2gJQSv54uTS4a+tWncBYmAuhSiM6otmAO4OgNz6zz
 F8WmLf6IdkYSNsiLDg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MS4WT-1ub4hq1rAp-00VsaB; Sat, 10 May 2025 14:03:25 +0200
Content-Type: multipart/alternative;
 boundary="------------MfVJlgetY58PZTM6eedPaseE"
Message-ID: <9cfba854-24f8-41bc-9f78-44852bed7c3d@oldschoolsolutions.biz>
Date: Sat, 10 May 2025 14:03:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 00/45] drm/msm/dp: Add MST support for MSM chipsets
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Guenter Roeck <groeck@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
X-Provags-ID: V03:K1:QleC2uSmYuR5CojDBquY1PeogUOZW64rzhcBqtnW4bINLAwGaxu
 XrbY6ZqRxCx0hxCBVdtWW12+vdam8DlDR7yMVx5HgzivIuHtvc8qU/UuLK97bnK7kegG1bm
 u2zzWEpmGCMToJuXvfdGgg4ZyFIBHg2UVVhJKeU40t2vOTDDwl0HRpJtQa4YxIA7iM9G173
 0asLuKhcXoaO35xOsDlIA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MlD3gKthU6Y=;2yODLyHpW7DYB+49NfQ87pImbxG
 aXhCbUEfJJ/bkUaO7FaeJiF2egIJs2hW3/yC/5IrCAG5MwAT+kLoZpoQiSJBSY6HQFmY00GPA
 GRqs69iHBZ31zslBmDnr5LgT2MoVpwL2FZuRo6vtnoTD15TOG/MebctN2x05czf/0+ppcvXkd
 /FLfbcBYRR1OSNpofMVWvq5MoZumKf8j9j7Aen9JIbwyrZdTF83/dVETPTu89RvrVMboZpIvw
 AGFdpW+zTK0lypEYBI2l2cXMDkKGC3ONFGqpWwRjnF9lhcHTfaVsb+rof4C0airJpbZ540M06
 bOfFGJOOeQrrNGDYLY4SmPjjCKKYUwERyqa4XiFxg3AXcEb4Ot2XIw6WCh4BPFaDy32PrdCzH
 VkEkWIx5jgTMDJm4cUr60ET/l6TMYiiHPO2rMfNbOljTUGmVJ2yKFMgArIgsN5+K6UKWdkQ2L
 CSOQdGDIHIT2eJeucNQ9otye8buVv4FwUpiPC7oJxq+IuK2EBjm7l8XYpvB3istsqzs+2ZyGs
 NKvu65+mFoAzWxoPafbTF1G5yZyvLIUPrZLkGc3+bdtRjHK+qY+DGDIXZvPmOjxQ4bMk3jIxo
 Arie8d2BC4eeENaJerd9Wbv00PBVgHaNpVab/VtR4D/h7S9Mwl1fP9AKTpMb2YgE5G7v+QYpG
 0eEuyBd8DNlIHs2Qy8mG9bb9uPjB2boBAjiHqNa7ttCCSvDmiA+duRvVXAIXiRfF5qV0Qjs4v
 VkCyy18B3Zx4g1fqXyFmF+dxAwQuWE/V0r/u7SVbCDX+d3/+S8B/V0t+mXexX5jbQFNVELasb
 I0OkGwTzHEK3CT38a2+95KfDtqpVkjLcnNdQE0Xnx4cAYqOHR/F6DSzHbQ6z0IlpAmLMzuKJz
 YVhytSTfwQJyXna25lYVeeniK3FxY38wZqM4i1dWZsBJmNpmWv2ZbPl4QjwJ9uwE9qCIfkSJ/
 01J/WUWztKRNXd2WgFSGotuahmJ1sQAmo7zpjOUaSBwJKdECPVc8fvhFTkoqC70Fdy0G0b+ny
 lz4Vyb4f8wGnmtwFn18hGYjX7tshuS5IYlW8zFK+x/sVW//MH0X1NOPUgkRQh5qKjZ2xBQ9iT
 TbuExWgdk2ZhqiYH87bIzr5B8IXEJ8KFweA+01YVVGMrYWyWSA9vmz6JrZBaRnwD4uIkzTzau
 I4Z6eSouf6H31PaeR2GmOVk7kRHoSFd/ZlTnEH5LDKsEKzDaQZdNfjaZeuF203J6SKNcK3n0L
 U/887awk03s8LeFIdrv6y7NmFan76Q26RCEq14wru9PVSXX8iQdqCRgdyQXTGqpNi17phriVI
 JB+wFBK78oGFH3qDPAlcNJNMHCXzU6+/NDyTo3BnnXPNBmBvMcdHw+LAWmZ6j/qNke8RyHrGk
 vJYxpf4DUG5nZ6deMzhlGHIBbCo0blM4bywWRaH+IcvWw1/tCxCO6ZpnPw
X-Mailman-Approved-At: Sat, 10 May 2025 23:07:20 +0000
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

This is a multi-part message in MIME format.
--------------MfVJlgetY58PZTM6eedPaseE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 06.12.24 05:31, Abhinav Kumar wrote:
> base-commit: b166256c1e6ce356fa1404d4c8531830e6f100a8

Hi Abhinav,

I would like to test / play around with this patchset, unfortunately=20
this base commit is not easy to find. Trying to apply without gives lots=
=20
of conflicts. Can you please rebase?

with best regards

Jens

--------------MfVJlgetY58PZTM6eedPaseE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 06.12.24 05:31, Abhinav Kumar wrote:<span
      style="white-space: pre-wrap">
</span></div>
    <blockquote type="cite"
      cite="mid:20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com">
      <pre wrap="" class="moz-quote-pre">base-commit: b166256c1e6ce356fa1404d4c8531830e6f100a8
</pre>
    </blockquote>
    <p>Hi Abhinav,</p>
    <p>I would like to test / play around with this patchset,
      unfortunately this base commit is not easy to find. Trying to
      apply without gives lots of conflicts. Can you please rebase?</p>
    <p>with best regards</p>
    <p>Jens</p>
  </body>
</html>

--------------MfVJlgetY58PZTM6eedPaseE--
