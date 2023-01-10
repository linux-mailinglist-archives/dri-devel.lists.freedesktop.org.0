Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4E26648AE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 19:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDD710E11D;
	Tue, 10 Jan 2023 18:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604FC10E11D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 18:13:31 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id ss4so23586927ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 10:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E971UMGcXwgaAFeIMfskNyBawiDJacixiUkz6okj188=;
 b=n6Y61za4DxKZcQVv04jf0Kgy/LIVUVbd4dG6UI8Zy/mgSnLr8dFB94wEL3D8vJWy07
 3fYwMJAyasn8+fgepgopiyJW5gT0JlyNIYGnbYYZqaf89dLtI/Ckiz+e9CVeijhxne3B
 1CEL/s/UaNtXnjR9P/8nONCzQPlb7gMzuzSB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E971UMGcXwgaAFeIMfskNyBawiDJacixiUkz6okj188=;
 b=V5LcLbjKWDCgE4j7eV4RU208fbfnWvuG8yGxTbSnTY5HdrtjXaCCsdwgk4ei9IxyeB
 ins8ghEaUJTxb6HcDzJgRMARYTw1JaEEPxRPTrQg7AUiwjDv8Ofq+dC/h38Oqq3G5OiZ
 QPiPh01vFdJiP/+auOaJllbmyWie88YtFV9SGLZ9rMXhi5AqwWkPglVRBkei0Gis5dDi
 7r4eVPlHv54wpDdMNKlsQ8vAp9gFigoRA3dPaEiceqZ4Pcn6DadUNQlh0M2uUb7gMsyT
 tEUd7Bs3vUw4JP5fAplreRB12GL1XYLK7jhRr7U4SzSMQYddYsXBQQNGILCzHIq9gF6d
 Qohw==
X-Gm-Message-State: AFqh2ko96MN1PBhuBED/5Q1hCtu0L7YgBVPasviulOq1HPqhvzHlwu3Y
 AbohriVqfOB9UC0u5H+FHdw9lf5ZD34YVr9EEL0=
X-Google-Smtp-Source: AMrXdXtK5PLE+skzFYWUa7LOkRMUNNUkbgbnh2iRp/Fz33FEALKGMJRRmEkRhjHoMJetdDpfbf7e3g==
X-Received: by 2002:a17:906:284d:b0:7ad:b865:d3b7 with SMTP id
 s13-20020a170906284d00b007adb865d3b7mr59378862ejc.21.1673374409833; 
 Tue, 10 Jan 2023 10:13:29 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 17-20020a170906201100b007bff9fb211fsm5156402ejo.57.2023.01.10.10.13.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 10:13:27 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id e3so3469073wru.13
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 10:13:27 -0800 (PST)
X-Received: by 2002:a5d:6ad0:0:b0:2bc:da90:2ab8 with SMTP id
 u16-20020a5d6ad0000000b002bcda902ab8mr99344wrw.659.1673374407473; Tue, 10 Jan
 2023 10:13:27 -0800 (PST)
MIME-Version: 1.0
References: <20230110025006.10409-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20230110025006.10409-1-jiasheng@iscas.ac.cn>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Jan 2023 10:13:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V5DDNtmpLRDGgSx1YVbd8UqTpcYFmvSAxFczn_JY+VmQ@mail.gmail.com>
Message-ID: <CAD=FV=V5DDNtmpLRDGgSx1YVbd8UqTpcYFmvSAxFczn_JY+VmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Drop the redundant fail label
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
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
Cc: marex@denx.de, vkoul@kernel.org, sean@poorly.run, vladimir.lypak@gmail.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jan 9, 2023 at 6:50 PM Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
>
> @@ -1954,9 +1949,8 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>
>         msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
>         if (msm_host->irq < 0) {
> -               ret = msm_host->irq;
>                 dev_err(&pdev->dev, "failed to get irq: %d\n", ret);
> -               return ret;
> +               return msm_host->irq;

The dev_err() is no longer printing the right value of "ret" above.

Other than that this looks reasonable to me. Feel free to add my
Reviewed-by tag once the above bug is fixed.

-Doug
