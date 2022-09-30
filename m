Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B06F85F1C5E
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 15:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110C510E5CD;
	Sat,  1 Oct 2022 13:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039AC10E63F
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 13:35:57 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id a2so10731951lfb.6
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 06:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date; bh=CG8R/L4pPWym3ANx8yZmnov0YG/TUNdQM5EA24rS0E4=;
 b=N9J0yu8iM/3JtfDrLUqQ7eLX+G46XOkk9eo7UzHX5O/dCngza/nNFP6sKRwKRegMck
 m+zUfXZ1UWd5SQPtZCLuUxS+cnJshjHAenZsqrdRkoE+DM60rl+XEPSi4WSMddAGtzmi
 YAH8a87oMDq8yZwcVCt87/7+G6EqZ0HaZFCyY0utpKzvKwtg7YiezDQSSSQ69nNUPlyU
 18Cq7UWSYds2OkpFofvAfX9fFTnAaU+Al36tPqeZbyPOZIChMytX/DHDTeb/bo6n+dXl
 hi4WbxCUNmgsCtGiSfupJqBuxN5nUwF0Z3sn1SB5mD3yRhI3H7OjR9qv4Lt/2Zfehsm8
 NMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=CG8R/L4pPWym3ANx8yZmnov0YG/TUNdQM5EA24rS0E4=;
 b=T+sUnqh3lxOHUEQ2t08OmkTfno/AdEryb1GNdpbUhm1OwMaSFa4xDBun7AmHxuE8Rx
 +qSYre80KE9kJpd/qYFhDw7eEVRuEv9RVnSdVV5S32Y4UrNpTEbVxS3P2LxOSfcoGsE3
 TrybKEnZ+ww76n3UnJHkcfK1sQso+ef4eAYDVu9CFh74wPmWu74s0IFbqrk20QQoKfQq
 P6K1fMiHgTqoTDYv4kzNSg2YMnHrJDkhuS2Bmp1UpSq5XM9gLRY28GJ0mfVoUvDrulBb
 W1VxxkvWM330DFmNMbsHcN0o10fpkiAgqC/d5HSln3JzCahuUMpsB8XyZd15ubW0IJ3d
 Ttig==
X-Gm-Message-State: ACrzQf3dIEsgJph5eXSLrC5/6Bm5RTgG2onHYnYqN0EXimihSXceuDR/
 w9dpJu3f3Y7DsyWv1v0CxF8YckcnE953ig==
X-Google-Smtp-Source: AMsMyM6tNn6Klrg0MZ813hnxa860FCdvafuOX5sG75uoogp4vuSYjUvohonmolvNEZP3W0ujEByI9g==
X-Received: by 2002:a05:6512:31d1:b0:499:fa38:3d7b with SMTP id
 j17-20020a05651231d100b00499fa383d7bmr4763301lfe.544.1664631356000; 
 Sat, 01 Oct 2022 06:35:56 -0700 (PDT)
Received: from [127.0.0.1] ([188.162.64.124]) by smtp.gmail.com with ESMTPSA id
 q9-20020a0565123a8900b004994c190581sm761096lfu.123.2022.10.01.06.35.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 01 Oct 2022 06:35:55 -0700 (PDT)
Date: Fri, 30 Sep 2022 11:29:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>,
 Kalyan Thota <quic_kalyant@quicinc.com>
Subject: =?US-ASCII?Q?Re=3A_=5Bv5=5D_drm/msm/disp/dpu1=3A_add_suppo?=
 =?US-ASCII?Q?rt_for_dspp_sub_block_flush_in_sc7280?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAD=FV=UT-GmAOYrCBRU0bhGeXU=pOGDbk=Jq7JEk40tyEH0zLA@mail.gmail.com>
References: <1663157784-22232-1-git-send-email-quic_kalyant@quicinc.com>
 <CAD=FV=UT-GmAOYrCBRU0bhGeXU=pOGDbk=Jq7JEk40tyEH0zLA@mail.gmail.com>
Message-ID: <59745151-7A97-4640-A8A2-5D06ABE1FBF4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29 September 2022 19:13:20 GMT+03:00, Doug Anderson <dianders@chromium=
=2Eorg> wrote:
>Hi,
>
>On Wed, Sep 14, 2022 at 5:16 AM Kalyan Thota <quic_kalyant@quicinc=2Ecom>=
 wrote:
>>
>> Flush mechanism for DSPP blocks has changed in sc7280 family, it
>> allows individual sub blocks to be flushed in coordination with
>> master flush control=2E
>>
>> Representation: master_flush && (PCC_flush | IGC_flush =2E=2E etc )
>>
>> This change adds necessary support for the above design=2E
>>
>> Changes in v1:
>> - Few nits (Doug, Dmitry)
>> - Restrict sub-block flush programming to dpu_hw_ctl file (Dmitry)
>>
>> Changes in v2:
>> - Move the address offset to flush macro (Dmitry)
>> - Seperate ops for the sub block flush (Dmitry)
>>
>> Changes in v3:
>> - Reuse the DPU_DSPP_xx enum instead of a new one (Dmitry)
>>
>> Changes in v4:
>> - Use shorter version for unsigned int (Stephen)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Ec       |  2 +-
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Ec |  5 +++-
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Eh |  4 +++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Ec     | 35 ++++++++++++++++=
++++++++--
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Eh     | 10 ++++++--
>>  5 files changed, 50 insertions(+), 6 deletions(-)
>
>Breadcrumbs: though this is tagged in the subject as v5 I think the
>newest version is actually "resend v4" [1] which just fixes the
>Signed-off-by=2E

Not to mention that v5 misses the S-o-B tag=2E

>
>[1] https://lore=2Ekernel=2Eorg/r/1663825463-6715-1-git-send-email-quic_k=
alyant@quicinc=2Ecom

--=20
With best wishes
Dmitry
