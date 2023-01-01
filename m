Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 507E965AABE
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jan 2023 17:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8516E10E0C2;
	Sun,  1 Jan 2023 16:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1CF10E0C2
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jan 2023 16:48:25 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id x37so20184477ljq.1
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Jan 2023 08:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ge4PP1SVJmKzIUfpzygbNjv7xfpf7GwfAHU5wdsn3v8=;
 b=iyWofjg1cuc1wFt7FbNU03134Ig4lU4d7FLbhbPl/5XKtZZzoggW9hhf/5Bn+T6NRV
 vyntxu9tdPh1FFPRtc2lY87M26ZGGIJvH+dsuUEHpuuTK3+I2rrTkAMDLJJEDFotdKTu
 poawfAgq6/2fO+SRgzqMWgpDpBv8DpBjh57Bmg3fVlvJ5YcrAG3/2X4uuAUeNeZI/ALY
 PvcQkh+5DnchCubmpZoa2BeP/bFzZsL4cO1PNVoidx0jjCQGZaR2PpUGEIp7uwaL8hhu
 IV19ZfdqZlmWN41RXaFzCWFCpY61XLp2dAJuKLIjTyK4ooYqDjR36JiFbpihzlNBi+xx
 VIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ge4PP1SVJmKzIUfpzygbNjv7xfpf7GwfAHU5wdsn3v8=;
 b=46h9v9XZlQkbC1lNWityGXtLiT1fnlujBavgn8mmvF2MOBaTHGiNRUjna2TPNhgw2h
 8cSmYMosgLA8jqOGAwdZwEd3z4w6/xaksLQVq9bP6b+6iDGAsuDpyoPbDy+zZ49aphaJ
 0ioEDMwk4PBAZFDnu0rejeEHXGSi2DkJdTfejUsyuU+qIj7VidPkSRBU6dTALn9Z/Sao
 31ZyyHxO9Ql22ubIkOzchi7cIGW3WxitYZL5nBy167xffhlTy+gU71I1OzsT3iNsf13k
 8Ko8LfZGUCwib3MIfMULOByGJ/ln1toCBpTDMg3v7LEYtFKfmjeZKuBIY0Is0PYEU4kk
 xjBg==
X-Gm-Message-State: AFqh2kpPdw5/+4pqQT6m0fCt1dQFlwgaktnSAE23ri/aecyAcRTWkcGy
 ZCGz86GcS/UqwS1ts5lRZ8ljSw==
X-Google-Smtp-Source: AMrXdXsbed8972ttl4tuW+r6II/l4+IDIN3XfWFXtwKU+S+h7RqPDrhNKmmYR0qUvjU6oenThQCNSA==
X-Received: by 2002:a2e:88c2:0:b0:27f:d050:d95c with SMTP id
 a2-20020a2e88c2000000b0027fd050d95cmr4172562ljk.10.1672591703879; 
 Sun, 01 Jan 2023 08:48:23 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a05651c039a00b0027e4da2d952sm3014101ljp.68.2023.01.01.08.48.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Jan 2023 08:48:23 -0800 (PST)
Message-ID: <9d77ed88-a6b7-74f0-4f0e-f67b3ab15982@linaro.org>
Date: Sun, 1 Jan 2023 18:48:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/a2xx: support loading legacy (iMX) firmware
Content-Language: en-GB
To: Fabio Estevam <festevam@gmail.com>
References: <20230101155753.779176-1-dmitry.baryshkov@linaro.org>
 <CAOMZO5AaZrXe8w7XhzG5LzCxdodOde-5ACV6Kgd8B+uYneKxWA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAOMZO5AaZrXe8w7XhzG5LzCxdodOde-5ACV6Kgd8B+uYneKxWA@mail.gmail.com>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/01/2023 18:38, Fabio Estevam wrote:
> Hi Dmitry,
> 
> On Sun, Jan 1, 2023 at 12:58 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> Support loading A200 firmware generated from the iMX firmware header
>> files. The firmware lacks protection support, however it allows GPU to
>> function properly while using the firmware files with clear license
>> which allows redistribution.
> 
> Could you please share more details as to what firmware you are using
> with the i.MX53?

I have been testing i.MX53 with the firmware generated from EfikaMX 
generated files 
(https://github.com/genesi/linux-legacy/tree/master/drivers/mxc/amd-gpu).

> Is it available on the linux-firmare repository?

Not yet. As the firmware have clear attribution and clear licence 
(BSD-3) which allows redistribution, I'm going to send pull request to 
linux-firmware as soon as the approach, presented in this patch, is 
accepted by Rob.

-- 
With best wishes
Dmitry

