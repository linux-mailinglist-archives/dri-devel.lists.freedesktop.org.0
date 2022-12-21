Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC13654DCD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840DF10E615;
	Fri, 23 Dec 2022 08:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F5110E12A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 09:52:02 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id 186so15877003ybe.8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 01:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q7sIkNaLWjx1fFIRDeksx1Bh/LCbJsIlgGGmVwmS/Lg=;
 b=F1NkzfEHPTLeEaB5NuAbK9KsI1FcgsXRzpQ5yCjit3xU0Ek4F0G4wWDn63+9KVtoiu
 CBW8da2j1YkRvy0QoPCb3xShxPQ0PPpCX25OLDzoYEguLuQVrSPj12OjM/ncZ21dayBj
 YRUMwmNo0ShuOmCmKiBgULgpbmqHzDyDHDB0/cmkG47QcHugz9EE41zE30HaSdbw6Gjc
 xBAB+olMr+r3YUpBSZjN9XKngaeoBKamUZlLhmhpwNiRuRK1ZgmNumu5dHrKwn+FZq2v
 7YHK2FdCTV3Ls050vfCzaZaX3Rgrm7tB6HOY2YwHPwnwbGe2IsWdKS+dL1vYgFhr391X
 gpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q7sIkNaLWjx1fFIRDeksx1Bh/LCbJsIlgGGmVwmS/Lg=;
 b=crHPaLTcZtZCA8qMswA4IMoMf9B/FD71ta7P7vq6ChmdU/QHDdYZ2+8VLmk1FGraYA
 upqQwGstQQWGFBq8Wf42SGjnB1FGvmESxyBTDUDjvPQRlJtzPW2SR8lRwrB+mKE2Msga
 CvXmHjUN6FIiMZVYg3yZ9hQXxBQGysj+brmRNxyxsRvUhvLlEM3tkZvRMGrnqh0BDdHv
 N021kfydrlu/y1n9yiNehv3N/hAV6vXU40/5Att2Ni1pUZ8r3VJ9dquMXVCs0c2F0NEW
 CptI1N08iIp4gqEEzrHqGz+g+MwyjEe6fh5hGvL6t1V/zsczsN8dtOdQdE+6Caoseb+w
 ywKw==
X-Gm-Message-State: AFqh2koHfhgsy8yA/8lLnbasYTTCFHFZKVG4zCBvRIHE19hbiX5/7VkR
 EhoeybVKcGr2cvyBwBF3rBZ6+1Ec4oDZN+s63Q0=
X-Google-Smtp-Source: AMrXdXvzu7iVSCLvjIfOh8H5HSloiBny73NhHt1abq0uWoXfLyOlhFZezi8nA9T9CRYnIcudpc/UAnMBME73/AdO5Ok=
X-Received: by 2002:a25:4042:0:b0:6f9:64f8:491 with SMTP id
 n63-20020a254042000000b006f964f80491mr142475yba.111.1671616322220; Wed, 21
 Dec 2022 01:52:02 -0800 (PST)
MIME-Version: 1.0
References: <20221221070216.17850-1-lujianhua000@gmail.com>
 <d37e0f2d-eaa5-4eaa-72bb-ead349235d6d@linaro.org>
 <CAEo_cxGK_m_VM1k0EWerfS2b2DF5ucvftQj68h3kBZz2=L=YGQ@mail.gmail.com>
 <cb84a044-0508-2b5b-13aa-a081d0e90afd@linaro.org>
In-Reply-To: <cb84a044-0508-2b5b-13aa-a081d0e90afd@linaro.org>
From: jianhua lu <lujianhua000@gmail.com>
Date: Wed, 21 Dec 2022 17:51:50 +0800
Message-ID: <CAEo_cxHhQs2ra5dCd4qnqcHsM7AVcfLXknnoPcMJ3FHyyL8rZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: leds: backlight: add binding for Kinetic
 KTZ8866 backlight
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000016380505f05381ce"
X-Mailman-Approved-At: Fri, 23 Dec 2022 08:44:26 +0000
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000016380505f05381ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, I will

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E4=BA=8E 2022=E5=B9=
=B412=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89
17:46=E5=86=99=E9=81=93=EF=BC=9A

> On 21/12/2022 10:40, jianhua lu wrote:
> > Thanks for review, I will resend this path.
>
> Are you going to test it, before sending?
>
> Best regards,
> Krzysztof
>
>

--00000000000016380505f05381ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Yes, I will<br><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Krzysztof Kozlowski &lt;<a href=3D"mailto:k=
rzysztof.kozlowski@linaro.org">krzysztof.kozlowski@linaro.org</a>&gt; =E4=
=BA=8E 2022=E5=B9=B412=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:46=E5=86=99=
=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 21/12/2022 10=
:40, jianhua lu wrote:<br>
&gt; Thanks for review, I will resend this path.<br>
<br>
Are you going to test it, before sending?<br>
<br>
Best regards,<br>
Krzysztof<br>
<br>
</blockquote></div></div></div>

--00000000000016380505f05381ce--
