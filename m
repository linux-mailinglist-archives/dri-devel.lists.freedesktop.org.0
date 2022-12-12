Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A81B64AA60
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 23:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6237A10E141;
	Mon, 12 Dec 2022 22:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17DB10E141
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 22:35:26 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id d131so15558355ybh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 14:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IpAeK55ZtLsOItOVOsZUW0VX0dmUGZuhAd/spodi2Go=;
 b=t14B1twGGRg6SASEJ+ZLGhHuryfaHLhvHJZJifSYAGZy7SktUGgGzYTV4SMEtrr2F+
 NtAzSMIt9OgezFwIGrt5tvSLxJ664bJKgh7QHEpd9DSKH+TibYunqdwkeoNB70HdtaC+
 u3wF5OQ3i1B71t8u/ghJ1uxJc4G7oo6GVUpDcKo2KBURmuyEDvvMkQgZyhzxbVvXxlX0
 r1n0D258M0NkEx9Si+rocmFToLwfkEAIVegzKll09XNS7xODgko0a+pvEqvWtJf0CYYM
 y2LR/qumoXQUQ4BY9gQ1KC1OlXq5qTTWEufUmBCTjL+Ijj8z3uWKmDPLG14ABDPisIxZ
 rCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IpAeK55ZtLsOItOVOsZUW0VX0dmUGZuhAd/spodi2Go=;
 b=opBoRvq8tybxjLs/meIShwoS3XtV99Q+YZKvWCcjAh66RMS6+mLLCTQWZUfQ3LuS7b
 rVaNXKXEJ38FkS7u8EhriyWEfW8BD5sRCGWC6VNh5oAGWPXROKyE2bbJWK5NfGEmp1EZ
 YJtzvB1tE+S6UdQNCMBJcbCwt4yMfLizTWHg22MEvH9B25wf696S66GEbVXYjaNwyUjV
 e6Zv93EST2Zf5wIJTQ4R5qW3GCSFuCbmoL2mn9AHkuLO6mkwP+N/mRFP2/3f2CDToq6t
 J/sc+KyodZGfnxAC1OHQUT33VrD9t8aabYePIPzcJ1qBK+QiqLRwLXXmeh/e3uBN2tcJ
 OLnw==
X-Gm-Message-State: ANoB5plxE/dB3TqLp2kdi3IAvC4CSa+zqN0NHygTubYrWVtBgt7EfDmG
 Fa/4qvqLXyaE46XdGCZnP/nYTdi3kW6eFg22TmJK+w==
X-Google-Smtp-Source: AA0mqf6vQuxCOzGUSvZb2kDX2AlckUYquLDzfG7G1uiKoRmVPaZPcfA52u7eXv04oPAKviSZIokhuxUkroshPyUJ3hc=
X-Received: by 2002:a25:384a:0:b0:710:a8a6:d45 with SMTP id
 f71-20020a25384a000000b00710a8a60d45mr3558285yba.152.1670884525944; Mon, 12
 Dec 2022 14:35:25 -0800 (PST)
MIME-Version: 1.0
References: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
 <1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com>
 <5a3865ed-8847-db04-3d60-f35438250bef@linaro.org>
 <5aa16223-dbf6-996c-1985-794302dcce91@quicinc.com>
 <be1411e8-1d07-7643-977c-a306016fd660@linaro.org>
 <b6d90c1f-5365-7197-be63-96c3d8cf0746@quicinc.com>
 <e53844b7-601b-f355-302b-cc871962a446@linaro.org>
 <8b306c8f-3089-4aaf-7fc1-038a8330c89a@quicinc.com>
In-Reply-To: <8b306c8f-3089-4aaf-7fc1-038a8330c89a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Dec 2022 00:35:14 +0200
Message-ID: <CAA8EJpr5RYyQa7xu1_xJ0F-dn-H9aOf0KE-CDgDCwnZu3HPgXg@mail.gmail.com>
Subject: Re: [PATCH v11 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: devicetree@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 quic_abhinavk@quicinc.com, andersson@kernel.org, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, robh+dt@kernel.org,
 vkoul@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Dec 2022 at 19:51, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 12/8/2022 4:35 PM, Dmitry Baryshkov wrote:
> > On 09/12/2022 02:22, Kuogee Hsieh wrote:
> >>
> >> On 12/8/2022 4:11 PM, Dmitry Baryshkov wrote:
> >>> On 09/12/2022 01:38, Kuogee Hsieh wrote:
> >>>>
> >>>> On 12/8/2022 3:33 PM, Dmitry Baryshkov wrote:
> >>>>> On 09/12/2022 00:36, Kuogee Hsieh wrote:
> >>>>>> Add both data-lanes and link-frequencies property into endpoint
> >>>>>>
> >>>>>> Changes in v7:
> >>>>>> -- split yaml out of dtsi patch
> >>>>>> -- link-frequencies from link rate to symbol rate
> >>>>>> -- deprecation of old data-lanes property
> >>>>>>
> >>>>>> Changes in v8:
> >>>>>> -- correct Bjorn mail address to kernel.org
> >>>>>>
> >>>>>> Changes in v10:
> >>>>>> -- add menu item to data-lanes and link-frequecnis
> >>>>>>
> >>>>>> Changes in v11:
> >>>>>> -- add endpoint property at port@1
> >>>>>>
> >>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>`
> >>>>>
> >>>>> Applying: dt-bindings: msm/dp: add data-lanes and link-frequencies
> >>>>> property
> >>>>> .git/rebase-apply/patch:47: trailing whitespace.
> >>>>>
> >>>>> .git/rebase-apply/patch:51: trailing whitespace.
> >>>>>
> >>>>>
> >>>>> Also the dt_binding_check fails with an error for this schema. And
> >>>>> after fixing the error in the schema I faced an example validation
> >>>>> error. Did you check that the schema is correct and that the
> >>>>> example validates against the schema?
> >>>>
> >>>> yes, but i run "make dt_binding_check
> >>>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/dp-controller.yaml"
> >>>> at mu v5.15 branch since
> >>>
> >>> I wouldn't ask you to post the log here. But I don't think that
> >>> either of the errors that I see here is related to 5.15 vs 6.1-rc.
> >>>
> >>> In fact after applying this patch against 5.15 I saw the expected
> >>> failure:
> >>>
> >>> Documentation/devicetree/bindings/display/msm/dp-controller.yaml:
> >>> properties:required: ['port@0', 'port@1'] is not of type 'object',
> >>> 'boolean'
> >>> Documentation/devicetree/bindings/display/msm/dp-controller.yaml:
> >>> properties: 'required' should not be valid under {'$ref':
> >>> '#/definitions/json-schema-prop-names'}
> >>> Documentation/devicetree/bindings/display/msm/dp-controller.yaml:
> >>> ignoring, error in schema: properties: required
> >>>
> >>>>
> >>>> "make dt_binding_check" does not work at msm-next branch.
> >>>
> >>> I went ahead and just checked.
> >>>
> >>> `make dt_binding_check DT_SCHEMA_FILES=display/msm`  works cleanly
> >>> in msm-next and reports a single example-related warning in
> >>> msm-next-lumag. I pushed a patch to fix that warning (wich can
> >>> hopefully be picked up by Abhinav into msm-fixes). So you can assume
> >>> that both these branches have consistent error-free display/msm
> >>> schemas.
> >>>
> >> I have clean msm-next branch (without my data-lines yaml patch
> >> applied) and run "make dt_binding_check
> >> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/dp-controller.yaml",
> >> then I saw below error messages.
> >>
> >> Have you run into this problem?
> >
> > No.
>
> Did you do anything to fix "older dtschema instance"?

I did not since I hadn't had such a problem. I can refer again to the
steps I provided you beforehand. The email was sent 6 days ago. No
answer from your side since that time.

> I had run  "pip3 install dtschema --upgrade" and still not work.

Can you please post a full log of this command?

>
> D you know how to fix this problem?
>
> Thanks,
>
> kuogee
>
> sort: -:2: disorder: 2022.1
> ERROR: dtschema minimum version is v2022.3
> make[2]: *** [check_dtschema_version] Error 1
> make[1]: *** [dt_binding_check] Error 2
> make: *** [__sub-make] Error 2

Please add the output of:

which dt-validate
dt-validate -V

And also a full log of your failing kernel build.



> I had run "pip3 install dtschema --upgrade" according Rob Herring response.
> but it still shows same problem.
> Please let know how can I fix this problem.
>
> >
> >>
> >>    HOSTCC  scripts/basic/fixdep
> >>    HOSTCC  scripts/dtc/dtc.o
> >>    HOSTCC  scripts/dtc/flattree.o
> >>    HOSTCC  scripts/dtc/fstree.o
> >>    HOSTCC  scripts/dtc/data.o
> >>    HOSTCC  scripts/dtc/livetree.o
> >>    HOSTCC  scripts/dtc/treesource.o
> >>    HOSTCC  scripts/dtc/srcpos.o
> >>    HOSTCC  scripts/dtc/checks.o
> >>    HOSTCC  scripts/dtc/util.o
> >>    LEX     scripts/dtc/dtc-lexer.lex.c
> >>    HOSTCC  scripts/dtc/dtc-lexer.lex.o
> >>    HOSTCC  scripts/dtc/dtc-parser.tab.o
> >>    HOSTLD  scripts/dtc/dtc
> >> sort: -:2: disorder: 2022.1
> >> ERROR: dtschema minimum version is v2022.3
> >> make[2]: *** [check_dtschema_version] Error 1
> >> make[1]: *** [dt_binding_check] Error 2
> >> make: *** [__sub-make] Error 2
> >
> > This means that somewhere in your path you have an older dtschema
> > instance.
> >
> > When you sent me a question regarding this error, I asked for the
> > additional info. You provided none. Instead you went on sending the
> > untested patch that doesn't work.
>
> since i can not test it on msm-next so that I did test it at my v5-15
> branch.

Wrong.

>
> besides, i think i have to sent the whole series patches include this
> one to address your new comments on other patch.
>
> is this correct?

No. Please fix your system first, validate your patches and send them
afterwards. You can not expect others to do your job.

--
With best wishes
Dmitry
