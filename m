Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C3A6A4ACD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 20:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAC610E3C0;
	Mon, 27 Feb 2023 19:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9992010E3C0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 19:25:26 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bp25so10067353lfb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cgWx4j1iRBoR0bJzgBj11buFeB47DQp2YV544lFPPJI=;
 b=Bv4f+Him1QY4NeDDMe8+QZiamEs9RQqrFj0co+QGZwvgT7ugPoI7NOmucJMqoq8SIR
 Xdvg9YYJNEjmzAIfbaDC7Gy3OFzdBmmHaB4CFO1/0E1006cvZ4yEGiBwQIDHKCRiO5qP
 ava7ZpVkvSNrSMX5JqucDdNQkDNFUmnAJUq7zQgDQdbSxu90kR8Zf1cvtmlMmzXD1e7H
 eTWYXA5EyoYgftqxY7nfY2DzW74RdUAHuvSyQVjKcnpR4QgWi9TnJFyNoXTl2rGFOGHF
 MNeGgWslDuIkbJuOmq7ttL1e3JjY5TlolkQj6Z3ZkRoLmodgCLloxTue+DDpcCssCb/t
 nFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cgWx4j1iRBoR0bJzgBj11buFeB47DQp2YV544lFPPJI=;
 b=t1/xZEk4yAWJezi5Eucox0eyD1GkmPLDgGMfx9Moi/kGpeQHXRmPDIq+j1AuTpQ/lH
 Nl6W2yOycyKaFYEAp8riJDqj+JZ9Xj09aGv3nirOmMcjsurtm5JWGF1ayNzFWAjsyERK
 j8a2C9o3VR/eBjz2nEf7Ait9LJXQCvFe9BqMLe7j61P75xrv2GMQUXGqsEH5jvSFkI6J
 eHhQdOun0PMqmUZiISz1cvjwTnChMwZpzOAgq0gMYWaGjLxP++f23wv2R/aD0GOj1j9R
 idImrxR/udDnlDCK5BzDkeD6PisWjHRtn8SnYdTxH97m6qTd58akzWxZH+Hjj5qrdqbA
 6Iwg==
X-Gm-Message-State: AO0yUKVc+9zjvxU/vfHpU4POKd2xK0RvwX1J8U9shzBKYlaa4eT7mOve
 GkvCzK8MPRm5zgVYjmbc6SyReQ==
X-Google-Smtp-Source: AK7set/1AHf2te8FppgvlXEm2aXwxguLuuw3q42f1xCPbote8Egkv3gXBUUY6eu4EvDo7PaEH2Arcw==
X-Received: by 2002:ac2:54b0:0:b0:4db:3e7e:51dc with SMTP id
 w16-20020ac254b0000000b004db3e7e51dcmr8059980lfk.55.1677525924667; 
 Mon, 27 Feb 2023 11:25:24 -0800 (PST)
Received: from [127.0.0.1] (85-76-146-80-nat.elisa-mobile.fi. [85.76.146.80])
 by smtp.gmail.com with ESMTPSA id
 a4-20020ac25204000000b004db44f782aesm1016914lfl.4.2023.02.27.11.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 11:25:24 -0800 (PST)
Date: Mon, 27 Feb 2023 21:25:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [RFC PATCH 1/2] drm/msm/dpu: add dsc helper functions
User-Agent: K-9 Mail for Android
In-Reply-To: <c650e746-64c5-ce6b-933d-057349356b78@quicinc.com>
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-2-git-send-email-quic_khsieh@quicinc.com>
 <42b3c193-8897-cfe9-1cae-2f9a66f7983a@linaro.org>
 <741be2a3-0208-2f40-eedf-d439c4e6795b@quicinc.com>
 <F8A4FC18-C64E-4011-BC08-18EB3B95A357@linaro.org>
 <d5ee8233-66c8-9b88-417c-6cf9cc5c84fe@quicinc.com>
 <CAA8EJpro5Q-2ZpnDJt40UhFX7Zp9oBhrto=FDOERzCDR2BDPvQ@mail.gmail.com>
 <f0dfba42-4674-3748-bf5d-39f6e1745f67@quicinc.com>
 <f1a6ee82-9502-7ea5-fe48-f296fc7df497@linaro.org>
 <3e114c0f-a042-6801-69bf-67436cb2a448@quicinc.com>
 <113a10b6-6097-c80e-c29c-6f61b2b2896a@linaro.org>
 <c4c0ebf8-275d-500f-4019-e3d7517a884f@quicinc.com>
 <CAA8EJppxX4haZSwdvVbN7bc6kXAyNO1rg6zWZv9wPFdqGrcXuw@mail.gmail.com>
 <c650e746-64c5-ce6b-933d-057349356b78@quicinc.com>
Message-ID: <58E03B71-20C4-4F81-96C1-6D8CE517F3FB@linaro.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, andersson@kernel.org,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 agross@kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 marijn.suijten@somainline.org, swboyd@chromium.org, sean@poorly.run,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

27 =D1=84=D0=B5=D0=B2=D1=80=D0=B0=D0=BB=D1=8F 2023 =D0=B3=2E 19:59:35 GMT+0=
2:00, Abhinav Kumar <quic_abhinavk@quicinc=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
>
>
>On 2/27/2023 4:45 AM, Dmitry Baryshkov wrote:
>> On Mon, 27 Feb 2023 at 01:49, Abhinav Kumar <quic_abhinavk@quicinc=2Eco=
m> wrote:
>>>=20
>>>=20
>>>=20
>>> On 2/26/2023 5:09 AM, Dmitry Baryshkov wrote:
>>>> On 26/02/2023 02:47, Abhinav Kumar wrote:
>>>>> Hi Dmitry
>>>>>=20
>>>>> On 2/25/2023 7:23 AM, Dmitry Baryshkov wrote:
>>>>>> On 25/02/2023 02:36, Abhinav Kumar wrote:
>>>>>>>=20
>>>>>>>=20
>>>>>>> On 2/24/2023 3:53 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Sat, 25 Feb 2023 at 00:26, Abhinav Kumar
>>>>>>>> <quic_abhinavk@quicinc=2Ecom> wrote:
>>>>>>>>> On 2/24/2023 1:36 PM, Dmitry Baryshkov wrote:
>>>>>>>>>> 24 =D1=84=D0=B5=D0=B2=D1=80=D0=B0=D0=BB=D1=8F 2023 =D0=B3=2E 23=
:23:03 GMT+02:00, Abhinav Kumar
>>>>>>>>>> <quic_abhinavk@quicinc=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>>>>>> On 2/24/2023 1:13 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>>> On 24/02/2023 21:40, Kuogee Hsieh wrote:
>>>>>>>>>>>>> Add DSC helper functions based on DSC configuration profiles
>>>>>>>>>>>>> to produce
>>>>>>>>>>>>> DSC related runtime parameters through both table look up an=
d
>>>>>>>>>>>>> runtime
>>>>>>>>>>>>> calculation to support DSC on DPU=2E
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> There are 6 different DSC configuration profiles are support=
ed
>>>>>>>>>>>>> currently=2E
>>>>>>>>>>>>> DSC configuration profiles are differiented by 5 keys, DSC
>>>>>>>>>>>>> version (V1=2E1),
>>>>>>>>>>>>> chroma (444/422/420), colorspace (RGB/YUV), bpc(8/10),
>>>>>>>>>>>>> bpp (6/7/7=2E5/8/9/10/12/15) and SCR (0/1)=2E
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> Only DSC version V1=2E1 added and V1=2E2 will be added later=
=2E
>>>>>>>>>>>>=20
>>>>>>>>>>>> These helpers should go to
>>>>>>>>>>>> drivers/gpu/drm/display/drm_dsc_helper=2Ec
>>>>>>>>>>>> Also please check that they can be used for i915 or for amdgp=
u
>>>>>>>>>>>> (ideally for both of them)=2E
>>>>>>>>>>>>=20
>>>>>>>>>>>=20
>>>>>>>>>>> No, it cannot=2E So each DSC encoder parameter is calculated b=
ased
>>>>>>>>>>> on the HW core which is being used=2E
>>>>>>>>>>>=20
>>>>>>>>>>> They all get packed to the same DSC structure which is the
>>>>>>>>>>> struct drm_dsc_config but the way the parameters are computed =
is
>>>>>>>>>>> specific to the HW=2E
>>>>>>>>>>>=20
>>>>>>>>>>> This DPU file helper still uses the drm_dsc_helper's
>>>>>>>>>>> drm_dsc_compute_rc_parameters() like all other vendors do but
>>>>>>>>>>> the parameters themselves are very HW specific and belong to
>>>>>>>>>>> each vendor's dir=2E
>>>>>>>>>>>=20
>>>>>>>>>>> This is not unique to MSM=2E
>>>>>>>>>>>=20
>>>>>>>>>>> Lets take a few other examples:
>>>>>>>>>>>=20
>>>>>>>>>>> AMD:
>>>>>>>>>>> https://gitlab=2Efreedesktop=2Eorg/drm/msm/-/blob/msm-next/dri=
vers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu=2Ec#L165
>>>>>>>>>>>=20
>>>>>>>>>>>=20
>>>>>>>>>>> i915:
>>>>>>>>>>> https://gitlab=2Efreedesktop=2Eorg/drm/msm/-/blob/msm-next/dri=
vers/gpu/drm/i915/display/intel_vdsc=2Ec#L379
>>>>>>>>>>>=20
>>>>>>>>>>=20
>>>>>>>>>> I checked several values here=2E Intel driver defines more bpc/=
bpp
>>>>>>>>>> combinations, but the ones which are defined in intel_vdsc and =
in
>>>>>>>>>> this patch seem to match=2E If there are major differences ther=
e,
>>>>>>>>>> please point me to the exact case=2E
>>>>>>>>>>=20
>>>>>>>>>> I remember that AMD driver might have different values=2E
>>>>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>> Some values in the rc_params table do match=2E But the
>>>>>>>>> rc_buf_thresh[] doesnt=2E
>>>>>>>>=20
>>>>>>>> Because later they do:
>>>>>>>>=20
>>>>>>>> vdsc_cfg->rc_buf_thresh[i] =3D rc_buf_thresh[i] >> 6;
>>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>> https://gitlab=2Efreedesktop=2Eorg/drm/msm/-/blob/msm-next/drive=
rs/gpu/drm/i915/display/intel_vdsc=2Ec#L40
>>>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>> Vs
>>>>>>>>>=20
>>>>>>>>> +static u16 dpu_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] =3D {
>>>>>>>>> +               0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54,
>>>>>>>>> +               0x62, 0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
>>>>>>>>> +};
>>>>>>>>=20
>>>>>>>> I'd prefer to have 896, 1792, etc=2E here, as those values come f=
rom the
>>>>>>>> standard=2E As it's done in the Intel driver=2E
>>>>>>>>=20
>>>>>>>=20
>>>>>>> Got it, thanks
>>>>>>>=20
>>>>>>>>> I dont know the AMD calculation very well to say that moving thi=
s
>>>>>>>>> to the
>>>>>>>>> helper is going to help=2E
>>>>>>>>=20
>>>>>>>> Those calculations correspond (more or less) at the first glance =
to
>>>>>>>> what intel does for their newer generations=2E I think that's not=
 our
>>>>>>>> problem for now=2E
>>>>>>>>=20
>>>>>>>=20
>>>>>>> Well, we have to figure out if each value matches and if each of
>>>>>>> them come from the spec for us and i915 and from which section=2E =
So
>>>>>>> it is unfortunately our problem=2E
>>>>>>=20
>>>>>> Otherwise it will have to be handled by Marijn, me or anybody else
>>>>>> wanting to hack up the DSC code=2E Or by anybody adding DSC support=
 to
>>>>>> the next platform and having to figure out the difference between
>>>>>> i915, msm and their platform=2E
>>>>>>=20
>>>>>=20
>>>>> Yes, I wonder why the same doubt didn't arise when the other vendors
>>>>> added their support both from other maintainers and others=2E
>>>>>=20
>>>>> Which makes me think that like I wrote in my previous response, thes=
e
>>>>> are "recommended" values in the spec but its not mandatory=2E
>>>>=20
>>>> I think, it is because there were no other drivers to compare=2E In o=
ther
>>>> words, for a first driver it is pretty logical to have everything
>>>> handled on its own=2E As soon as we start getting other implementatio=
ns of
>>>> a feature, it becomes logical to think if the code can be generalized=
=2E
>>>> This is what we see we with the HDCP series or with the code being mo=
ved
>>>> to DP helpers=2E
>>>>=20
>>>=20
>>> We were not the second, MSM was/is the third to add support for DSC af=
er
>>> i915 and AMD=2E Thats what made me think why whoever was the second di=
dnt
>>> end up generalizing=2E Was it just missed out or was it intentionally =
left
>>> in the vendor driver=2E
>>=20
>> I didn't count AMD here, since it calculates some of the params rather
>> than using the fixed ones from the model=2E
>>=20
>>>=20
>>>>>=20
>>>>> Moving this to the drm_dsc_helper is generalizing the tables and not
>>>>> giving room for the vendors to customize even if they want to (which
>>>>> the spec does allow)=2E
>>>>=20
>>>> That depends on the API you select=2E For example, in
>>>> intel_dsc_compute_params() I see customization being applied to
>>>> rc_buf_thresh in 6bpp case=2E I'd leave that to the i915 driver=2E
>>>>=20
>>>=20
>>> Thanks for going through the i915 to figure out that the 6bpp is handl=
ed
>>> in a customized way=2E So what you are saying is let the helper first =
fill
>>> up the recommended values of the spec, whatever is changed from that l=
et
>>> the vendor driver override that=2E
>>>=20
>>> Thats where the case-by-case handling comes=2E
>>>=20
>>> Why not we do this way? Like you mentioned lets move these tables to t=
he
>>> drm_dsc_helper and let MSM driver first use those=2E
>>>=20
>>> Then in a separate patchset if i915 and AMD would like to move to that=
,
>>> let them handle it for their respective drivers instead of MSM going
>>> through whats customized for each calculation and doing it=2E
>>>=20
>>> I am hesitant to take up that effort=2E
>>=20
>> Writing a tool to convert model's rc_Nbpc_Mbpp_foo=2Ecfg into C
>> languages structures used by Intel code took 15-20 minutes=2E Plugging
>> generated structures took another 5 minutes=2E I will send the patches
>> later today or tomorrow, as I find a time slot to clean them=2E Thank
>> you for spending more time on arguing than it took me to generate &
>> verify the data=2E
>>=20
>
>Great, we will wait for your patches=2E We didnt intend to spend time on =
this at this point=2E We always wanted to take it up in a separate series o=
f moving the tables=2E

Getting rid of msm_display_dsc_config and then making use of drm_dsc_compu=
te_rc_parameters() was bad enough=2E So, let's get things done in a good wa=
y now, rather than at some random point later=2E


>
>You preferred not to wait=2E Upto you=2E
>
>So thanks for doing it=2E
>
>>>=20
>>> If the recommended values work for the vendor, they can clean it up an=
d
>>> move to the drm_dsc_helper themselves and preserving their
>>> customizations rather than one vendor doing it for all of them=2E
>>>=20
>>>> In case the driver needs to perform customization of the params, noth=
ing
>>>> stops it drop applying after filling all the RC params in the
>>>> drm_dsc_config struct via the generic helper=2E
>>>>=20
>>>>=20
>>>>> So if this has any merit and if you or Marijn would like to take it
>>>>> up, go for it=2E We would do the same thing as either of you would h=
ave
>>>>> to in terms of figuring out the difference between msm and the i915 =
code=2E
>>>>>=20
>>>>> This is not a generic API we are trying to put in a helper, these ar=
e
>>>>> hard-coded tables so there is a difference between looking at these =
Vs
>>>>> looking at some common code which can move to the core=2E
>>>>>=20
>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>> Also, i think its too risky to change other drivers to use
>>>>>>>>> whatever math
>>>>>>>>> we put in the drm_dsc_helper to compute thr RC params because
>>>>>>>>> their code
>>>>>>>>> might be computing and using this tables differently=2E
>>>>>>>>>=20
>>>>>>>>> Its too much ownership for MSM developers to move this to
>>>>>>>>> drm_dsc_helper
>>>>>>>>> and own that as it might cause breakage of basic DSC even if som=
e
>>>>>>>>> values
>>>>>>>>> are repeated=2E
>>>>>>>>=20
>>>>>>>> It's time to stop thinking about ownership and start thinking abo=
ut
>>>>>>>> shared code=2E We already have two instances of DSC tables=2E I d=
on't
>>>>>>>> think having a third instance, which is a subset of an existing
>>>>>>>> dataset, would be beneficial to anybody=2E
>>>>>>>> AMD has complicated code which supports half-bit bpp and calculat=
es
>>>>>>>> some of the parameters=2E But sharing data with the i915 driver i=
s
>>>>>>>> straightforward=2E
>>>>>>>>=20
>>>>>>>=20
>>>>>>> Sorry, but I would like to get an ack from i915 folks if this is g=
oing
>>>>>>> to be useful to them if we move this to helper because we have to
>>>>>>> look at every table=2E Not just one=2E
>>>>>>=20
>>>>>> Added i915 maintainers to the CC list for them to be able to answer=
=2E
>>>>>>=20
>>>>>=20
>>>>> Thanks, lets wait to hear from them about where finally these tables
>>>>> should go but thats can be taken up as a separate effort too=2E
>>>>>=20
>>>>>>>=20
>>>>>>> Also, this is just 1=2E1, we will add more tables for 1=2E2=2E So =
we will
>>>>>>> have to end up changing both 1=2E1 and 1=2E2 tables as they are
>>>>>>> different for QC=2E
>>>>>>=20
>>>>>> I haven't heard back from Kuogee about the possible causes of using
>>>>>> rc/qp values from 1=2E2 even for 1=2E1 panels=2E Maybe you can comm=
ent on
>>>>>> that? In other words, can we always stick to the values from 1=2E2
>>>>>> standard? What will be the drawback?
>>>>>>=20
>>>>>> Otherwise, we'd have to have two different sets of values, like you
>>>>>> do in your vendor driver=2E
>>>>>>=20
>>>>>=20
>>>>> I have responded to this in the other email=2E
>>>>>=20
>>>>> All this being said, even if the rc tables move the drm_dsc_helper
>>>>> either now or later on, we will still need MSM specific calculations
>>>>> for many of the other encoder parameters (which are again either
>>>>> hard-coded or calculated)=2E Please refer to the
>>>>> sde_dsc_populate_dsc_config() downstream=2E And yes, you will not fi=
nd
>>>>> those in the DP spec directly=2E
>>>>>=20
>>>>> So we will still need a dsc helper for MSM calculations to be common
>>>>> for DSI / DP irrespective of where the tables go=2E
>>>>>=20
>>>>> So, lets finalize that first=2E
>>>>=20
>>>> I went on and trimmed sde_dsc_populate_dsc_config() to remove
>>>> duplication with the drm_dsc_compute_rc_parameters() (which we alread=
y
>>>> use for the MSM DSI DSC)=2E
>>>>=20
>>>> Not much is left:
>>>>=20
>>>> dsc->first_line_bpg_offset set via the switch
>>>>=20
>>>> dsc->line_buf_depth =3D bpc + 1;
>>>> dsc->mux_word_size =3D bpc > 10 ? DSC_MUX_WORD_SIZE_12_BPC:
>>>>           DSC_MUX_WORD_SIZE_8_10_BPC;
>>>>=20
>>>> if ((dsc->dsc_version_minor =3D=3D 0x2) && (dsc->native_420))
>>>>       dsc->nsl_bpg_offset =3D (2048 *
>>>>                (DIV_ROUND_UP(dsc->second_line_bpg_offset,
>>>>                                   (dsc->slice_height - 1))));
>>>>=20
>>>> dsc->initial_scale_value =3D 8 * dsc->rc_model_size /
>>>>                           (dsc->rc_model_size - dsc->initial_offset);
>>>>=20
>>>>=20
>>>> mux_word_size comes from the standard (must)
>>>> initial_scale_value calculation is recommended, but not required
>>>> nsl_bpg_offset follows the standard (must), also see below (*)=2E
>>>>=20
>>>> first_line_bpg_offset calculation differs between three drivers=2E Th=
e
>>>> standard also provides a recommended formulas=2E I think we can leave=
 it
>>>> as is for now=2E
>>>>=20
>>>> I think, that mux_word_size and nsl_bpg_offset calculation should be
>>>> moved to drm_dsc_compute_rc_parameters(), while leaving
>>>> initial_scale_value in place (in the driver code)=2E
>>>>=20
>>>> * I think nsl_bpg_offset is slightly incorrectly calculated=2E Standa=
rd
>>>> demands that it is set to 'second_line_bpg_offset / (slice_height - 1=
),
>>>> rounded up to 16 fraction bits', while SDE driver code sets it to the
>>>> value rounded up to the next integer (having 16 fraction bits
>>>> representation)=2E
>>>>=20
>>>> In my opinion correct calculation should be:
>>>> dsc->nsl_bpg_offset =3D DIV_ROUND_UP(2048 * dsc->second_line_bpg_offs=
et,
>>>>                                   (dsc->slice_height - 1));
>>>>=20
>>>> Could you please check, which one is correct according to the standar=
d?
>>>>=20
>>>>=20
>>>=20
>>> Sure, i will check about nsl_bpg_offset=2E But sorry if I was not more
>>> clear about this but sde_dsc_populate_dsc_config() is only one example
>>> which from your analysis can be moved to the drm_dsc_helper() but not
>>> the initial line calculation _dce_dsc_initial_line_calc(),
>>> _dce_dsc_ich_reset_override_needed() , _dce_dsc_setup_helper()=2E
>>=20
>> The initial_line is already calculated in dpu_encoder=2Ec=2E As for the
>> _dce_dsc_ich_reset_override_needed(), I don't think we support partial
>> updates in the upstream driver=2E
>>=20
>>>=20
>>> All of these are again common between DSI and DP=2E
>>>=20
>>> So in addition to thinking about what can be moved to the drm_dsc_help=
er
>>> also think about what is specific to MSM but common to DSI and DP modu=
les=2E
>>>=20
>>> That was the bigger picture I was trying to convey=2E
>>=20
>
>_dce_dsc_initial_line_calc which will get expanded with v1=2E2 gets added=
 has much more than whats there in upstream today=2E
>
>Dumping everything in dpu_encoder is not the solution=2E Sorry=2E

But it is still the DPU thing=2E So, no problems=2E

>
>>=20
>>=20

