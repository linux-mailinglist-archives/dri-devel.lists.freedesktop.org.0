Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F542758E4A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4B910E3FD;
	Wed, 19 Jul 2023 07:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC85610E362
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 14:32:45 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-26304be177fso3109477a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 07:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689690765; x=1690295565;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vd+uFPWLpIQPh4SFHZpsAuGHKOc6yNS+XOp7OBcXgLA=;
 b=kFrND2l0r68i9Cz0nyT/ldG+rz4laT0IoN22GEQ7FTv+W945MTU6v7/4hZytopwM7x
 kEpF6ZhmeoGvUGI391B5uzn4MG9xUbwcqxEmAc94fFzocPtKTTxs15C9cpUt4nva116M
 ykAN10CdGqGB4KABZyZJM8v9X0CYFxJcWJmFfMEgvgkmyFRvNS3nSeCrvwyTJNP9RFRd
 vNJmiHdslPJ9EbZSO2GK9h6FWtulmcheaOacgsP8Uf+NBUGcpNM/ba1Ec+6942PVXxe+
 WT7o9LkaYUeX8k/joLiAXMGHq1rnoV0Y8j6i0FLybKoknJfDKAJ/qJZd+5j9mL8/CV3c
 R3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689690765; x=1690295565;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vd+uFPWLpIQPh4SFHZpsAuGHKOc6yNS+XOp7OBcXgLA=;
 b=Z69omPnZF5tMuMau86LVhMXnbDpAoj+0GaTDO+SjffzJTCk1PIvOMyv4cgQvmVPWA7
 zmi6/1y4LQir+qX0ZzMRVbEkBpSqTQTOF5DDNe9KTcTaMY07+hEph8NIsU/UZwR39qjk
 c082WetBkt2LBeXsG5S/m+drofxOyZpGrxCIIE6Kj4pNKGTvVkDZA/xxwoDcI49Pqxd7
 abG7jXwdLJ3lGT88oDkYvLtDMA53cuSz5kE2L4N2uMiF+yXe8A23fxWISRqFf7lG2aHv
 wqZPRHN3LtuYVCMoi/6Y+PpF1Bkzm9acw30N9i2lTYkkC46XdlksZLUP/MuBNosvveeE
 FP9w==
X-Gm-Message-State: ABy/qLbPimrvaezaXBNKuF+6gRG3tZOZ7v6gjSGBVLMsTkP8cUqaffhO
 CSl+re8xgp6cHNMpatzatOk3lG0Y3h6Aodum5jDhs4uf
X-Google-Smtp-Source: APBJJlFp9W+n/8ZsZGaB7+VUEmcTeN+3V6qSGo7Ythk5tBFqT59lFadxEaPiu6K9POKDcMTnYujYOG1PkhLhVxKC48g=
X-Received: by 2002:a17:90a:49ca:b0:262:df1d:8e16 with SMTP id
 l10-20020a17090a49ca00b00262df1d8e16mr12457915pjm.33.1689690764808; Tue, 18
 Jul 2023 07:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAF23GwBA6R45968qDv4v-r+sKicjojVifqGsEDh8=F9RVkJ1Hw@mail.gmail.com>
 <CAJa=HVrHdoL3ZLUS-nmYXUxQd-MvLAG=NKm_rQsMnXObg8ZU-w@mail.gmail.com>
In-Reply-To: <CAJa=HVrHdoL3ZLUS-nmYXUxQd-MvLAG=NKm_rQsMnXObg8ZU-w@mail.gmail.com>
From: SUNIDHI DIXIT <sdikshit786@gmail.com>
Date: Tue, 18 Jul 2023 20:02:32 +0530
Message-ID: <CAF23GwB7fBmhZiV1-Anr=v_qV4AeAO7RKKfoQZ4QKCR21XqLDQ@mail.gmail.com>
Subject: Re: [BUG]: Getting a unique connector name when identical displays
 are connected
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000d117940600c3c93d"
X-Mailman-Approved-At: Wed, 19 Jul 2023 07:01:14 +0000
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

--000000000000d117940600c3c93d
Content-Type: text/plain; charset="UTF-8"

I am waiting for response on this please guide.

On Sat, Jul 15, 2023, 7:50 PM Freelancer Intern <
internfreelancer21@gmail.com> wrote:

> I have also seen this case...
>
> On Thu, Jul 13, 2023, 1:14 PM SUNIDHI DIXIT <sdikshit786@gmail.com> wrote:
>
>> Hello all,
>>
>> This is regarding an issue I have encountered recently in drm. When I
>> connect two identical HDMI display(with same resolution) there is no way to
>> distinguish them uniquely.
>>
>> I looked into that and found that the connector id, and connector_type_id
>> can be changed based on which connector appears first to the kernel.
>>
>> Is there any solution already implemented for this problem?
>>
>> I see following solution to this issue:
>>
>> Assigning a unique connector->name from drm_connector_init() and adding
>> an api drmModeGetConnectorName().
>>
>> Please let me know what you think..
>>
>> Thanks in advance!
>>
>

--000000000000d117940600c3c93d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I am waiting for response on this please guide.</div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Ju=
l 15, 2023, 7:50 PM Freelancer Intern &lt;<a href=3D"mailto:internfreelance=
r21@gmail.com">internfreelancer21@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"auto">I have also seen this case...=C2=
=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Jul 13, 2023, 1:14 PM SUNIDHI DIXIT &lt;<a href=3D"mailto:sdiksh=
it786@gmail.com" target=3D"_blank" rel=3D"noreferrer">sdikshit786@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">H=
ello all,<div dir=3D"auto"><br></div><div dir=3D"auto">This is regarding an=
 issue I have encountered recently in drm. When I connect two identical HDM=
I display(with same resolution) there is no way to distinguish them uniquel=
y.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I looked into that an=
d found that the connector id, and connector_type_id can be changed based o=
n which connector appears first to the kernel.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Is there any solution already implemented for this p=
roblem?</div><div dir=3D"auto"><br></div><div dir=3D"auto">I see following =
solution to this=C2=A0issue:</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Assigning a unique connector-&gt;name from drm_connector_init() and ad=
ding an api drmModeGetConnectorName().</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Please let me know what you think..</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Thanks in advance!</div></div>
</blockquote></div>
</blockquote></div>

--000000000000d117940600c3c93d--
