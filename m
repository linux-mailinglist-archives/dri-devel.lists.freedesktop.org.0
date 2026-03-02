Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MH4EECgpWmuCAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:35:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39091DAF5C
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AD910E517;
	Mon,  2 Mar 2026 14:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="qOK7MGK9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4929410E517
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 14:35:39 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-65f9a875eabso8361679a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 06:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1772462138; x=1773066938; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUn+iB4YXlBbjldwrLtAyNCdXFG7HtVdj+Ul3fGYGNA=;
 b=qOK7MGK970N2FI6Z2G+azuiEujEiFrRCNmI6AIjRXTY1NtARtQ13TkG9+/nUVGmIJe
 otHyZP1n+CGml+08NW8tLbLvSbrf6KVo5MnQD9DfeEy/sJ1mHnX4wFWPZKiO6qS5f0RO
 hvpe/J63RUuzygXUTy6bu0mZFdX1YEyXfZ3r3z/iSl6XUUI/pd/9poMJ1M3u/deOiEQS
 nceQnWuch3sLORumGfNSVTHYLEza4pVq+BZ8vzxXi/JcK3rBMoqg59dbbZS7ihh8jo+0
 2sG127knmfWFzGHNiYAvjXCx05TBZC1Nr9BjVrgXlGTyOOmJkldhvEVChQ5XGk7i9/D/
 sDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772462138; x=1773066938;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fUn+iB4YXlBbjldwrLtAyNCdXFG7HtVdj+Ul3fGYGNA=;
 b=VeV3L00G5qeheLQadhgm9EWpYH7LM8CRJxU8sMNxMw1ggVCCaXse+FWk/Ia+T6+KAc
 CC2NiUtnRiAa21cAlYzZAZjlg7OFWMN6WEACvm2Ens6erTM8FVX7nZZkI3QxGKcLpIYK
 SXpg6DMhBAQOGvR8MN0PnqfIzfKChkYf8udEd16VxNAIxJyaxajRPY7bCgt/DgOSp3/d
 Tnur3a+2XmLSgZeRunkILqdkqNIoWzLfELd3UqyINztnseiSnUaUUXhy30Y0Iz9JirfW
 iLClBOuuZWbqHlYb7BGve5Yx46AJh08s86FewJ6akNkmT/DrO0YQ3hjg3/3VtKLha3Uq
 otBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPcu+pDyxulb+sFaT2Srn5wtM/9GcoYtk/h2EN9pMkQcqAtFWAINzikkLh1mgzN+ea0iXVMk9GBqI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUjHWesCDDU+ElSgLbebbNALSyCjmrChn93dFPO1okVH+FBiuw
 FnpNMqYLnxyGUJf1vp0DHtaFfoOK/Nb5LMGpKmDmpg23hH4hjHsmz7bceZolp6Y1+Sc=
X-Gm-Gg: ATEYQzw6A8eSGty4C97Ge1TiLnviqFMA1NbQjeTim5s9HY1ZWZOtjYZ0nJYg5NCJ93l
 6Plee9I4SJ3NvcpzeitbJ2EQS7IrVEZd5IEHYwhsZpzZA4mLyKAYZYr85p1LqfSKOoMGAr5tCyN
 2V45o1iCF92sStdOcuypK5CzM3OxDANNYSGK1zhf4PJ8wI5vd7DFjvBO/1wDK5ziy09A5kW/td1
 MzytJOfnK0/0hYvdzBTQLNfd6rDNGG4LaW7CpFA65+Ad564Zxo7z17by4KZph55NCT8ogzrTeRm
 w3DnpCSxaEXG5KCiAS+YzCQRquze0Zab8qwUSghXBD0xzWEid1Ba7jS8O+a91EAaJ1YGTqCwHPe
 WVgM1/wf+JyU6tjwME1fabtmxOtj4UCkVdkiYaCgPd7knXSJhVtFhfNW+U3hebiYpUlIwsquPQO
 MfSUfpJ6kWGAoa5mOULQ4PhylBK7q8CD7WXI4KBKNzsPt8SPV9BJTDbQJwQtR0Ctr60nH+uQ3aK
 CSSaQ0=
X-Received: by 2002:a17:907:1043:b0:b8e:9e11:6615 with SMTP id
 a640c23a62f3a-b93765539c4mr610839266b.47.1772462137447; 
 Mon, 02 Mar 2026 06:35:37 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl.
 [144.178.202.139]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9385836a84sm337168566b.59.2026.03.02.06.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 06:35:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 15:35:36 +0100
Message-Id: <DGSDE0ID17DQ.XQZNKZH5UKPO@fairphone.com>
Cc: "yuanjiey" <yuanjie.yang@oss.qualcomm.com>,
 <robin.clark@oss.qualcomm.com>, <lumag@kernel.org>,
 <abhinav.kumar@linux.dev>, <jesszhan0024@gmail.com>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <krzysztof.kozlowski@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <tingwei.zhang@oss.qualcomm.com>,
 <aiqun.yu@oss.qualcomm.com>, <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
 <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
 <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
In-Reply-To: <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
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
X-Rspamd-Queue-Id: D39091DAF5C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yuanjie.yang@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzysztof.kozlowski@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:yongxing.mou@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri Feb 27, 2026 at 8:05 PM CET, Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 12:34:04PM +0100, Konrad Dybcio wrote:
>> On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
>> > On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
>> >> On 1/12/26 9:25 AM, yuanjiey wrote:
>> >>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
>> >>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.c=
om> wrote:
>> >>>>>
>> >>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
>> >>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
>> >>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>=20
>> [...]
>>=20
>> > Please correct me if I'm wrong, if we drop dev_pm_opp_set() from
>> > dpu_runtime_suspend, then we should be able to also skip setting OPP
>> > corner in dpu_runtime_resume(), because the previously set corner shou=
ld
>> > be viable until drm/msm driver commits new state / new modes.
>>=20
>> That matches my understanding.
>>=20
>> > The only important issue is to set the corner before starting up the
>> > DPU, where we already have code to set MDP_CLK to the max frequency.
>> >=20
>> > Which means, we only need to drop the dev_pm_set_rate call from the
>> > dpu_runtime_suspend().
>>=20
>> I concur.
>>=20
>> >> For MDSS, we're currently generally describing the MDSS_AHB clock, th=
e
>> >> GCC_AHB clock and the MDP clock (sounds wrong?) - there's not even an=
 OPP
>> >=20
>> > No. As far as I remember, MDP_CLK is necessary to access MDSS register=
s
>> > (see commit d2570ee67a47 ("drm/msm/mdss: generate MDSS data for MDP5
>> > platforms")), I don't remember if accessing HW_REV without MDP_CLK
>> > resulted in a zero reads or in a crash. At the same time it needs to b=
e
>> > enabled to any rate, which means that for most of the operations
>> > msm_mdss.c can rely on DPU keeping the clock up and running.
>> >=20
>> >> table.. The GCC clock is sourced from (and scaled by) the NoC, but th=
e
>> >> MDSS_AHB one seems to have 3 actually configurable performance points
>> >> that neither we nor seemingly the downstream driver seem to really ca=
re
>> >> about (i.e. both just treat it as on/off). If we need to scale it, we
>> >> should add an OPP table, if we don't, we should at least add required=
-opps.
>> >=20
>> > I think, dispcc already has a minimal vote on the MMCX, which fulfill
>> > these needs.
>>=20
>> I have slightly mixed feelings, but I suppose that as we accepted Commit
>> e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable the doma=
in"),
>> we can generally agree that it makes sense that calling genpd->on() actu=
ally
>> turns on the power indeed
>>=20
>> What I'm worried about is if the clock is pre-configured to run at a hig=
h
>> frequency from the bootloader (prepare_enable only sets the EN bit in th=
e RCG,
>> and doesn't impact the state of M/N/D at a glance), we may get a brownou=
t
>>=20
>> This rings the "downstream really did it better with putting clock dvfs =
states
>> into the clk driver" bell, but I suppose the way to fight this would be =
to
>> simply set_rate(fmax) there too..
>>=20
>> I attempted an experiment with pulling out the plug. MMCX enabled with t=
he
>> AHB clock off results in a read-as-zero. I tried really hard to disable =
the
>> mdp clock, but it seems like the "shared_ops" reflect some sort of "you
>> *really* can't just disable it" type behavior (verified with debugcc)
>
> I think, in 8996 it was possible to disable it. Not sure about
> 8998/630/660.
>
>>=20
>>=20
>> There's a possible race condition if we don't do it:
>>=20
>> ------- bootloader --------
>> configure display, mdp_clk=3Dturbo
>> ------- linux -------------
>> load rpmhpd     |
>> load venus      |
>> set mmcx=3Dlowsvs | mdp_clk is @ turbo
>>                 | brownout
>>                 |=20
>>                 | <mdss would only probe here>
>>=20
>> *but* that should be made impossible because of .sync_state().
>
> Yep, sync_state should prevent MMCX or CX from dropping under the boot
> level.
>
>>=20
>> This may impact hacky setups like simplefb, but as the name implies,
>> that's hacky.
>>=20
>> Relying on .sync_state() however will not cover the case if the mdss
>> module is removed and re-inserted later, possibly with mmcx disabled
>> entirely but the clock not parked at a sufficiently low rate.
>>=20
>>=20
>> TLDR: reassess whether MDSS needs the MDP clock, if so, we should just
>> plug the MDP opp table into it and set_rate(fmax) during mdss init
>
> And what will drop it afterwards? MDSS will still vote on the MMCX / CX
> level even though DPU will change the clock freq.
>
>>=20
>> >> The MDP4/MDP5 drivers are probably wrong too in this regard, but many
>> >> targets supported by these may not even have OPP tables and are gener=
ally
>> >> not super high priority for spending time on.. that can, I'd kick dow=
n the
>> >> road unless someone really wants to step up
>> >=20
>> > I'd really not bother with those two drivers, unless we start seing
>> > crashes. For MDP4 platforms we don't implement power domains at all, n=
o
>> > interconnects, etc., which means that the system will never go to a
>> > lower power state.
>>=20
>> Right. Might be that 2030-something arrives and armv7 is gone before som=
eone
>> randomly decides to work on that!
>>=20
>> > MDP5 platforms mostly don't have OPP tables. (I'm not counting MSM8998=
 /
>> > SDM630 / SDM660 here). MSM8917 / MSM8937 have only DSI tables, MSM8976
>> > has both MDP and DSI tables (my favourite MSM8996 has none). Probably =
we
>> > should start there by adding missing bits adding corresponding
>> > dev_pm_set_rate() calls as required (as demostrated by the DPU driver)=
.
>>=20
>> A bit off-topic, but:
>>=20
>> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
>>=20
>> 96 is in DPU. any other candidates that should be moved over?
>
> Let's go through them.
>
> All SoC except those currently supported in DPU require SMP (shared
> memory pool) support to be ported from the MDP5 driver.
>
> Most of the remaining platforms (except MSM8994/92) also had HW cursor
> implemented in a fancy way, in the LM rather than in a separate pipe.
> I'd really like to postpone those, possibly first completing migration
> of the other platforms and dropping support for them from MDP5.
>
> 1.0  - old MSM8974
>        I'd rather not touch it, it had bugs and I don't have HW
> 1.1  - MSM8x26
>        Probably Luca can better comment on it. Should be doable, but I
>        don't see upstream devices using display on it.

I have at least two MSM8x26 (1x APQ8026 lg-lenok & 1x MSM8926 htc-memul)
devices working with MDP5 fine. I should've probably upstreamed panel
driver & dts but they haven't been high priority..

Btw IOMMU support is here missing as well, so no GPU support anymore
since 6.17 if I'm not mistaken.

> 1.2  - MSM8974
>        I think it also had issues, no IOMMU support in upstream, etc.

Plenty of 'issues' for sure ;) but apart from GPU driver having dropped
no-IOMMU codepath they should be fairly fine, for what's currently
upstream.

I think also here, plenty of devices that do have panel support but not
much upstream. It's kind of all the same though, nothing exciting. Panel
driver with init sequence plus the same dts enablement bits.

Regards
Luca

> 1.3  - APQ8084
>        Had hw issues, no testing base, no MDSS in upstream DT
> 1.6  - MSM8916 / MSM8939
>        Can be done, low-hanging fruit for testing
> 1.7  - MSM8996
>        Supported in DPU
> 1.8  - MSM8936
>        No upsteram testing base
> 1.9  - MSM8994
>        No upstream testing base, no MDSS in upstream DT, normal CURSOR pl=
anes
> 1.10 - MSM8992
>        Even less testing base, no MDSS in upstream DT, normal CURSOR plan=
es
> 1.11 - MSM8956 / 76
>        No complete display configurations upstream
> 1.14 - MSM8937
>        Supported in DPU
> 1.15 - MSM8917
>        Supported in DPU
> 1.16 - MSM8953
>        Supported in DPU
> 1.17 - QCS405
>        Zero testing base, no MDSS in upstream DT
>
> MSM8994/92 would have been an ideal testbeds for SMP testing, but...
> they mostly don't exist (please correct me if I'm wrong). Which means
> that the next viable targets are MSM8916, MSM8x26 and MSM8956/76. All of
> them require SMP support and don't make sense without cursor handling.
>
>> > A note to myself to also add OPP tables support to the HDMI driver.
>>=20
>> Eliza!
>
> MSM8996 / 98!

