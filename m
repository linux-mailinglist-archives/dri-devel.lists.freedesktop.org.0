Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C128E64ACC0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 02:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF6210E19B;
	Tue, 13 Dec 2022 01:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF1810E2B7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 01:03:02 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id f20so1827485lja.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 17:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=c4uydtI+TJBxOHIdUWp7WaxP1AbUhc5qkc9V6EJvCic=;
 b=EEdB7Du271URciEUZOFlwc+L+uTXvnK00CZKbKg9UqPqnIdokWLS99gx8neaY6Qime
 mU18qWCUImn9sISphSIkjx68Am3qUuykYENCcvzeQQ3R7Awa9tfyPpSeub/FCZcs0e0M
 Fn7nubnlMx0U5HmdCvKJjz6jecoh26tWUcJ4CihrMn35UwC5Ozhh8Syq/P+VDu5e9DhH
 +TFIMHEwBKnp53TtMBbKqZ5o9gGLJ5kI/Gud9EdQqTcMByhFFKrwJfJ42ZhQUwy06Edu
 DB7Oqt0MdVb0Sn0Bi5pGhQcBrD607m/d0amc5XjWKHjKM6vlyBa/LdaPaCIb8QXAcEbd
 9ZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c4uydtI+TJBxOHIdUWp7WaxP1AbUhc5qkc9V6EJvCic=;
 b=NTM++F5VDYKj2469IOtPLwGtWLFXSxkFmpbVfcl9jkK0vqSkxSxhkeqo8hwacPPsET
 DwQ1ocqu3DhVh3ICC3xdhWyCvFy2sNy8aFE4MCb7ViuE02zdIEaIZvDTRwIt/UxRT8Ry
 C3Tc4cPzEV3+WlMmI/2FYXEc/MX8RsHIvfGQH+kCqaZD0amYV2PNznO5N3vqNyZX6VYL
 btK/deypTiGpt5g0FqGpKmqAW8aJDBbKeTHsotqx1YmG6FnLiw6dcZyQES/6/+kEZrFE
 zPBIZ0gIo/nN6ajAd9MV9ZmMDalmYDv+tfsKEbw8qcq/XRjgtKIsXbpeONl/6pTK5qQB
 OAbA==
X-Gm-Message-State: ANoB5pnxeC2vDsVPkj1HcSx74xNecWrqNuM7n7P1WJFVlKxNmrrpOIGd
 1D+9PML+MkBE8diqeRg9xaqrMA==
X-Google-Smtp-Source: AA0mqf6/0+m1rsZkaUSHO7NwIJA9CMcebS/GmvIxG6UAb/gfbNFdP87gMoYB+be+y+4Mw4ambQTXOg==
X-Received: by 2002:a2e:3a15:0:b0:27a:129f:770d with SMTP id
 h21-20020a2e3a15000000b0027a129f770dmr4414846lja.45.1670893380349; 
 Mon, 12 Dec 2022 17:03:00 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.107]) by smtp.gmail.com with ESMTPSA id
 u16-20020a05651c131000b0027760138c53sm137967lja.72.2022.12.12.17.02.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Dec 2022 17:02:59 -0800 (PST)
Date: Tue, 13 Dec 2022 04:02:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v11_2/5=5D_dt-bindings=3A_msm/dp=3A_a?=
 =?US-ASCII?Q?dd_data-lanes_and_link-frequencies_property?=
User-Agent: K-9 Mail for Android
In-Reply-To: <a9e2f269-b9df-814f-adcd-f5577f590fa7@quicinc.com>
References: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
 <1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com>
 <5a3865ed-8847-db04-3d60-f35438250bef@linaro.org>
 <5aa16223-dbf6-996c-1985-794302dcce91@quicinc.com>
 <be1411e8-1d07-7643-977c-a306016fd660@linaro.org>
 <b6d90c1f-5365-7197-be63-96c3d8cf0746@quicinc.com>
 <e53844b7-601b-f355-302b-cc871962a446@linaro.org>
 <8b306c8f-3089-4aaf-7fc1-038a8330c89a@quicinc.com>
 <CAA8EJpr5RYyQa7xu1_xJ0F-dn-H9aOf0KE-CDgDCwnZu3HPgXg@mail.gmail.com>
 <a9e2f269-b9df-814f-adcd-f5577f590fa7@quicinc.com>
Message-ID: <46971A33-D9A4-4A84-9058-62F69C5618F4@linaro.org>
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
Cc: devicetree@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 andersson@kernel.org, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, robh+dt@kernel.org,
 vkoul@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 13 December 2022 02:41:55 GMT+03:00, Abhinav Kumar <quic_abhinavk@quici=
nc=2Ecom> wrote:
>Hi Dmitry
>
>On 12/12/2022 2:35 PM, Dmitry Baryshkov wrote:
>> On Mon, 12 Dec 2022 at 19:51, Kuogee Hsieh <quic_khsieh@quicinc=2Ecom> =
wrote:
>>>=20
>>>=20
>>> On 12/8/2022 4:35 PM, Dmitry Baryshkov wrote:
>>>> On 09/12/2022 02:22, Kuogee Hsieh wrote:
>>>>>=20
>>>>> On 12/8/2022 4:11 PM, Dmitry Baryshkov wrote:
>>>>>> On 09/12/2022 01:38, Kuogee Hsieh wrote:
>>>>>>>=20
>>>>>>> On 12/8/2022 3:33 PM, Dmitry Baryshkov wrote:
>>>>>>>> On 09/12/2022 00:36, Kuogee Hsieh wrote:
>>>>>>>>> Add both data-lanes and link-frequencies property into endpoint
>>>>>>>>>=20
>>>>>>>>> Changes in v7:
>>>>>>>>> -- split yaml out of dtsi patch
>>>>>>>>> -- link-frequencies from link rate to symbol rate
>>>>>>>>> -- deprecation of old data-lanes property
>>>>>>>>>=20
>>>>>>>>> Changes in v8:
>>>>>>>>> -- correct Bjorn mail address to kernel=2Eorg
>>>>>>>>>=20
>>>>>>>>> Changes in v10:
>>>>>>>>> -- add menu item to data-lanes and link-frequecnis
>>>>>>>>>=20
>>>>>>>>> Changes in v11:
>>>>>>>>> -- add endpoint property at port@1
>>>>>>>>>=20
>>>>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>`
>>>>>>>>=20
>>>>>>>> Applying: dt-bindings: msm/dp: add data-lanes and link-frequencie=
s
>>>>>>>> property
>>>>>>>> =2Egit/rebase-apply/patch:47: trailing whitespace=2E
>>>>>>>>=20
>>>>>>>> =2Egit/rebase-apply/patch:51: trailing whitespace=2E
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>> Also the dt_binding_check fails with an error for this schema=2E =
And
>>>>>>>> after fixing the error in the schema I faced an example validatio=
n
>>>>>>>> error=2E Did you check that the schema is correct and that the
>>>>>>>> example validates against the schema?
>>>>>>>=20
>>>>>>> yes, but i run "make dt_binding_check
>>>>>>> DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/display/msm/dp=
-controller=2Eyaml"
>>>>>>> at mu v5=2E15 branch since
>>>>>>=20
>>>>>> I wouldn't ask you to post the log here=2E But I don't think that
>>>>>> either of the errors that I see here is related to 5=2E15 vs 6=2E1-=
rc=2E
>>>>>>=20
>>>>>> In fact after applying this patch against 5=2E15 I saw the expected
>>>>>> failure:
>>>>>>=20
>>>>>> Documentation/devicetree/bindings/display/msm/dp-controller=2Eyaml:
>>>>>> properties:required: ['port@0', 'port@1'] is not of type 'object',
>>>>>> 'boolean'
>>>>>> Documentation/devicetree/bindings/display/msm/dp-controller=2Eyaml:
>>>>>> properties: 'required' should not be valid under {'$ref':
>>>>>> '#/definitions/json-schema-prop-names'}
>>>>>> Documentation/devicetree/bindings/display/msm/dp-controller=2Eyaml:
>>>>>> ignoring, error in schema: properties: required
>>>>>>=20
>>>>>>>=20
>>>>>>> "make dt_binding_check" does not work at msm-next branch=2E
>>>>>>=20
>>>>>> I went ahead and just checked=2E
>>>>>>=20
>>>>>> `make dt_binding_check DT_SCHEMA_FILES=3Ddisplay/msm`  works cleanl=
y
>>>>>> in msm-next and reports a single example-related warning in
>>>>>> msm-next-lumag=2E I pushed a patch to fix that warning (wich can
>>>>>> hopefully be picked up by Abhinav into msm-fixes)=2E So you can ass=
ume
>>>>>> that both these branches have consistent error-free display/msm
>>>>>> schemas=2E
>>>>>>=20
>>>>> I have clean msm-next branch (without my data-lines yaml patch
>>>>> applied) and run "make dt_binding_check
>>>>> DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/display/msm/dp-c=
ontroller=2Eyaml",
>>>>> then I saw below error messages=2E
>>>>>=20
>>>>> Have you run into this problem?
>>>>=20
>>>> No=2E
>>>=20
>>> Did you do anything to fix "older dtschema instance"?
>>=20
>> I did not since I hadn't had such a problem=2E I can refer again to the
>> steps I provided you beforehand=2E The email was sent 6 days ago=2E No
>> answer from your side since that time=2E
>>=20
>>> I had run  "pip3 install dtschema --upgrade" and still not work=2E
>>=20
>> Can you please post a full log of this command?
>>=20
>>>=20
>>> D you know how to fix this problem?
>>>=20
>>> Thanks,
>>>=20
>>> kuogee
>>>=20
>>> sort: -:2: disorder: 2022=2E1
>>> ERROR: dtschema minimum version is v2022=2E3
>>> make[2]: *** [check_dtschema_version] Error 1
>>> make[1]: *** [dt_binding_check] Error 2
>>> make: *** [__sub-make] Error 2
>>=20
>> Please add the output of:
>>=20
>> which dt-validate
>> dt-validate -V
>>=20
>> And also a full log of your failing kernel build=2E
>>=20
>>=20
>>=20
>>> I had run "pip3 install dtschema --upgrade" according Rob Herring resp=
onse=2E
>>> but it still shows same problem=2E
>>> Please let know how can I fix this problem=2E
>>>=20
>>>>=20
>>>>>=20
>>>>>     HOSTCC  scripts/basic/fixdep
>>>>>     HOSTCC  scripts/dtc/dtc=2Eo
>>>>>     HOSTCC  scripts/dtc/flattree=2Eo
>>>>>     HOSTCC  scripts/dtc/fstree=2Eo
>>>>>     HOSTCC  scripts/dtc/data=2Eo
>>>>>     HOSTCC  scripts/dtc/livetree=2Eo
>>>>>     HOSTCC  scripts/dtc/treesource=2Eo
>>>>>     HOSTCC  scripts/dtc/srcpos=2Eo
>>>>>     HOSTCC  scripts/dtc/checks=2Eo
>>>>>     HOSTCC  scripts/dtc/util=2Eo
>>>>>     LEX     scripts/dtc/dtc-lexer=2Elex=2Ec
>>>>>     HOSTCC  scripts/dtc/dtc-lexer=2Elex=2Eo
>>>>>     HOSTCC  scripts/dtc/dtc-parser=2Etab=2Eo
>>>>>     HOSTLD  scripts/dtc/dtc
>>>>> sort: -:2: disorder: 2022=2E1
>>>>> ERROR: dtschema minimum version is v2022=2E3
>>>>> make[2]: *** [check_dtschema_version] Error 1
>>>>> make[1]: *** [dt_binding_check] Error 2
>>>>> make: *** [__sub-make] Error 2
>>>>=20
>>>> This means that somewhere in your path you have an older dtschema
>>>> instance=2E
>>>>=20
>>>> When you sent me a question regarding this error, I asked for the
>>>> additional info=2E You provided none=2E Instead you went on sending t=
he
>>>> untested patch that doesn't work=2E
>>>=20
>>> since i can not test it on msm-next so that I did test it at my v5-15
>>> branch=2E
>>=20
>> Wrong=2E
>>=20
>>>=20
>>> besides, i think i have to sent the whole series patches include this
>>> one to address your new comments on other patch=2E
>>>=20
>>> is this correct?
>>=20
>> No=2E Please fix your system first, validate your patches and send them
>> afterwards=2E You can not expect others to do your job=2E
>>=20
>
>Just finished working with kuogee on this=2E This issue had been reported=
 by few others earlier (example https://lore=2Ekernel=2Eorg/lkml/bc9be279-a=
130-d5e7-4397-bbb389d14403@intel=2Ecom/T/)=2E

Thanks a lot for helping Kuogee!


>
>So let me summarize the fix:
>
>1) We do need up upgrade the dtschema first
>
>pip3 install git+https://github=2Ecom/devicetree-org/dt-schema=2Egit@main

I'd stick to the released version, unless there is any indication that the=
 trunk has any significant features=2E Rob, Krzysztof, please correct me if=
 I'm wrong=2E


>
>2) Python version issues were hitting some of the developers so even if w=
e had the right version installed the PATH wasnt pointing to the right one

Yes, that is what I expected, when I asked for the pip command log and for=
 the `which' command output=2E

I usually install dtschema to my user's dir and add ~/=2Elocal/bin to PATH=
=2E

>
>3) We had to install yamllint
>
>We have documented these now for the benefit of others internally=2E
>
>With all these 3 done, we can compile msm-next-lumag using
>make dt_binding_check DT_SCHEMA_FILES=3Ddisplay/msm
>
>Apologies for the setup issues on our end=2E These are resolved now and k=
uogee will post a v12 for this=2E

Great, I'm looking forward to seeing it and finally merging it!


>
>Thanks
>
>Abhinav
>> --
>> With best wishes
>> Dmitry

--=20
With best wishes
Dmitry
