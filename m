Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEvyDugFcmmvZwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 12:11:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9785B65C2D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 12:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B040910E982;
	Thu, 22 Jan 2026 11:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UfBTlgMT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D5F10E983
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 11:11:31 +0000 (UTC)
Received: by mail-dl1-f53.google.com with SMTP id
 a92af1059eb24-1233608c7e9so120845c88.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 03:11:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769080290; cv=none;
 d=google.com; s=arc-20240605;
 b=DiMky9S5kXE2141iVQkV9KlqW5qEBjTlQ9Osc6ohFdD+xxBuRfKIwOjd1ahiMf+ILC
 +d9XRNTf3esJUiHzw8kxRkk9G1awWPRRjUj9yno+o9ikzPzAtvFFaqTcg0zxqQ5WVn9m
 4pAFH3yzrR+clJYcCxMYFMA4gL7ptcqm37qS9XHNA+Qv7S4dxhaiyGgDvdg7Z2h5GmHX
 qVUObVWGPiqWbN00EK2tDYKcdUx7FISFIbVNZ+5d17wEj2lNYdtRXnQ/77eHG2r5vsSZ
 7eLonWcfmUyLqcECtFRmhltmc71fSFvD/7ezawURTRHLlZZgdgjH87nI1tLlF/Ua5ECz
 cHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=iThoWmN+ezF6wgSZVKegq1NN/EVTp1gLlwP5B6Z6Hlg=;
 fh=1DEBWnGx7f4rUhnT2BxtzuXBub32OAGPmhtMrMaRqAM=;
 b=CDFK71Cj92n2X2B8U97gIw0MkN/et4N9M0tNioGb4Q3l+2IU831gU5bFRrZArQw0bo
 cElop6axwLzLTXWrZy7ihK9BGe7Omlp5PPKPZ623lEaRjCsJwGxU3ay+HcM7jx8OZupJ
 eK9x1NHZb35YJ8Knt7GbFffWjicbtjITR1ULJ4e3373RD7/DXrRr9uMy3D/YzSAGVTK0
 LnopQ+sTwpNT6NWOcv7snXOFkoP6e+3WJ/sFTRzJA1TnBWaNaG8fQUjZ5KOprkEJXGdQ
 RzJOLK9oRC7Hb83Wi9goq7BW841kFYFLsuJk6KrZZhTltvDjkmx5jQx5Wk8bGNsyLu4a
 flxQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769080290; x=1769685090; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iThoWmN+ezF6wgSZVKegq1NN/EVTp1gLlwP5B6Z6Hlg=;
 b=UfBTlgMTdWaRRNZusa2V7YCsp8Wa02UK0MaWNRzicvCPdX5BT84CHoe2e5Y4IcPSie
 rmAp6HQ8QW7pFCx6XQtdo56EMfZpdC2OnHiFMhhqbsdltR3XzPB81k0YoZTLd9qc7u9D
 pcGTuNL5ys17+pYBc392GTbFXuCGpN5whjU2rWoC8u4p6Xxw6L3QxAuUEDNf1jEZhoxY
 y0xQdnZHcUjGSs0xMz4OhBm0g/tV2+sR3UYMTotfIOGXpAXgppRUAwV+YqUNhFVs7mJ4
 +N5TaUy4+ZlCzusdFhvZFJczJrnzvCJ5kjtDZJIPI4taRn9dTeJ1pxWTP2qhGQeTOnxL
 KmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769080290; x=1769685090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iThoWmN+ezF6wgSZVKegq1NN/EVTp1gLlwP5B6Z6Hlg=;
 b=ByBBFAQ6eU1djJxCkW7ox3E3iZoyNGYyZpVl08qTGmT37qomv1fv/kumOTTHj4UQS9
 4FT+EsL1LypW3QlKX0/80RiFiEa2SSDNu6yb1OGqGRhap8KB8C4j3xMqDO4IlRLq88oO
 JAeP6HDcuVQegkiBJSYxnQISZT+gcMxD7zs3WigDTTsklgJCWo4zkN0XTcUJHC7sWVP/
 q+5OaqWrbeOnec7n6VuCXlUkYSGwafgj/ugFTTz6x3y9BCzs24a46T48vesXUbENmLeg
 Vych+JrEVgMzof35js2nCsVM25jlwLsewj8H69BssWrYlGVR57Wrb+Uz/HvcbMp+eDNF
 9big==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMCDSXuuUog4Qyri77/6DO5C7dIA2VYMYURJUfhOeaRFIRlmmhP6B5CWQHCRmBcITLYfVnHZDmeAc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2pOH3H/b+oDnMQ6R8T/rWiyiTUWtrnDSaI0gT3YScfro4AlcB
 RfIudFJcrnKJKhB8RDX93o/qmXmNtDkFtBZ9SX2wMUg+Hfk2qAcgtmmUKan2cStAU/+4n4DrGCF
 U/Umswhj/bf/Klpwt3xqDXbMoJuMOOZ4=
X-Gm-Gg: AZuq6aJR7KE/6ghjdPiAAJCFhj5Y1v5ajNCcvLYyN50oKMOSOJcZ2VfaQ0B07Lzr5Xd
 SyAfwOkov94+CT9nDwaPcIo5Smo3z46ROgPeWFJE/0e4klVcwlzybJ/7yfl/LPpSyDn3qgwAbEX
 ClmwJLouROXYzJoD4C4yPs8rznfU7RLLF4umkkBm/u0nFrmW1PGT5xKAkk1dzmL3vGkmUPgyBzk
 70WBEcJ+6SkyV+Qc4WEIiaxKeqiJfO191wt+g/toPdr28s4VnKTeSdamoMamXCn4XBZBXFQECck
 UQCopO/y3FBuSctEuBbw7haG7pNpFZney1bzd4i06X3VH6kT5NlkF1cFBxyfqH+HVKWPjh/Mzhg
 DPJXmAPbyfltwHA==
X-Received: by 2002:a05:7300:cb81:b0:2ae:5bd5:c241 with SMTP id
 5a478bee46e88-2b6b40e9b8emr8758758eec.7.1769080290378; Thu, 22 Jan 2026
 03:11:30 -0800 (PST)
MIME-Version: 1.0
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
 <20260122-nova-core-cmdq1-v1-3-7f8fe4683f11@nvidia.com>
 <ee459198-04f2-4bae-8e1f-4ec413d92f89@nvidia.com>
 <DFUUVM5M0MYA.36CL66OCAICDA@nvidia.com>
In-Reply-To: <DFUUVM5M0MYA.36CL66OCAICDA@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Jan 2026 12:11:18 +0100
X-Gm-Features: AZwV_QjN_wV0Mo2Zkx6MPAEQ8aLumlNjlfFkZ4gsw3rpfI-o6XR2aHStQu6ih-A
Message-ID: <CANiq72nbfsJF_Ly2vF5OPafUMMKN-OpqHYhKvFVNEGsxs5=q+g@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: fix improper handling of empty
 slot in cmdq
To: Eliot Courtney <ecourtney@nvidia.com>, Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="0000000000004987f70648f81a0c"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ecourtney@nvidia.com,m:lossin@kernel.org,m:jhubbard@nvidia.com,m:dakr@kernel.org,m:acourbot@nvidia.com,m:aliceryhl@google.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:apopple@nvidia.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel-bounces@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9785B65C2D
X-Rspamd-Action: no action

--0000000000004987f70648f81a0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Jan 2026 at 06:13, Eliot Courtney <ecourtney@nvidia.com> wrote:

> On Thu Jan 22, 2026 at 12:26 PM JST, John Hubbard wrote:
> > On 1/21/26 6:59 PM, Eliot Courtney wrote:
> >> +            // The area is contiguous and we leave an empty slot
> before `rx`.
> >> +            // PANIC: since `rx > tx` we have `rx - tx - 1 >=3D 0`
> >> +            // PANIC: since `tx < rx < MSGQ_NUM_PAGES &&
> after_tx.len() =3D=3D MSGQ_NUM_PAGES - tx`:
> >> +            //   `rx - 1 <=3D MSGQ_NUM_PAGES` -> `rx - tx - 1 <=3D
> MSGQ_NUM_PAGES - tx`
> >> +            //   -> `rx - tx - 1 <=3D after_tx.len()`
> >
> > Hi Eliot,
> >
> > Documentation nit: the proofs are great, but the above just does
> > not go into my head easily, because it's a proof, rather than a
> > sentence.
> I had a look now and I agree that it looks like plain English is the
> defacto standard for the PANIC comments, so I will update them.
>
> But, I wonder what people think about this. IMO it makes sense to have
> SAFETY and PANIC comments as rigorous proofs (where practical and
> possible) to match the level of work the compiler does for us in the
> infalliable areas of the code - if an issue occurs, unsafe or panicking
> code is often the root cause IMO. Writing these in plain English is
> easier to read but also harder to verify that the proof is correct and
> harder to verify if there are any implicit assumptions.


I am on the road, apologies for the formatting/HTML. This is something that
we have discussed back and forth. Please take a look at Benno=E2=80=99s pro=
posal at:

https://lore.kernel.org/all/20240717221133.459589-1-benno.lossin@proton.me/

(He may have a newer link)

Cheers,
Miguel

--0000000000004987f70648f81a0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">On Thu, 22 Jan 2026 at 06:13, Eliot Courtney &lt;<a href=
=3D"mailto:ecourtney@nvidia.com">ecourtney@nvidia.com</a>&gt; wrote:<br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(20=
4,204,204)">On Thu Jan 22, 2026 at 12:26 PM JST, John Hubbard wrote:<br>
&gt; On 1/21/26 6:59 PM, Eliot Courtney wrote:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // The area is contiguo=
us and we leave an empty slot before `rx`.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // PANIC: since `rx &gt=
; tx` we have `rx - tx - 1 &gt;=3D 0`<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // PANIC: since `tx &lt=
; rx &lt; MSGQ_NUM_PAGES &amp;&amp; after_tx.len() =3D=3D MSGQ_NUM_PAGES - =
tx`:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0`rx - 1 =
&lt;=3D MSGQ_NUM_PAGES` -&gt; `rx - tx - 1 &lt;=3D MSGQ_NUM_PAGES - tx`<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0-&gt; `r=
x - tx - 1 &lt;=3D after_tx.len()`<br>
&gt;<br>
&gt; Hi Eliot,<br>
&gt;<br>
&gt; Documentation nit: the proofs are great, but the above just does<br>
&gt; not go into my head easily, because it&#39;s a proof, rather than a<br=
>
&gt; sentence.<br>
I had a look now and I agree that it looks like plain English is the<br>
defacto standard for the PANIC comments, so I will update them.<br>
<br>
But, I wonder what people think about this. IMO it makes sense to have<br>
SAFETY and PANIC comments as rigorous proofs (where practical and<br>
possible) to match the level of work the compiler does for us in the<br>
infalliable areas of the code - if an issue occurs, unsafe or panicking<br>
code is often the root cause IMO. Writing these in plain English is<br>
easier to read but also harder to verify that the proof is correct and<br>
harder to verify if there are any implicit assumptions.</blockquote><div di=
r=3D"auto"><br></div><div dir=3D"auto"><div style=3D"font-size:inherit"><di=
v dir=3D"auto" style=3D"font-size:inherit;font-style:normal;font-weight:400=
;letter-spacing:normal;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgba(0,0,0,0);border-color:rgb(0,0,0);=
color:rgb(0,0,0)">I am on the road, apologies for the formatting/HTML.<span=
 style=3D"font-size:inherit">=C2=A0This is something that we have discussed=
 back and forth. Please take a look at Benno=E2=80=99s proposal at:</span><=
/div><div dir=3D"auto" style=3D"font-size:inherit;font-style:normal;font-we=
ight:400;letter-spacing:normal;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgba(0,0,0,0);border-color:rgb=
(0,0,0);color:rgb(0,0,0)"><br></div><div dir=3D"auto" style=3D"font-size:in=
herit;font-style:normal;font-weight:400;letter-spacing:normal;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgba(0,0,0,0);border-color:rgb(0,0,0);color:rgb(0,0,0)"><div style=3D"font=
-size:inherit" dir=3D"auto"><a href=3D"https://lore.kernel.org/all/20240717=
221133.459589-1-benno.lossin@proton.me/" style=3D"font-size:inherit">https:=
//lore.kernel.org/all/20240717221133.459589-1-benno.lossin@proton.me/</a></=
div></div><div dir=3D"auto" style=3D"font-size:inherit;font-style:normal;fo=
nt-weight:400;letter-spacing:normal;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgba(0,0,0,0);border-colo=
r:rgb(0,0,0);color:rgb(0,0,0)"><br></div><div dir=3D"auto" style=3D"font-si=
ze:inherit;font-style:normal;font-weight:400;letter-spacing:normal;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgba(0,0,0,0);border-color:rgb(0,0,0);color:rgb(0,0,0)">(He may have =
a newer link)</div><div dir=3D"auto" style=3D"font-size:inherit;font-style:=
normal;font-weight:400;letter-spacing:normal;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgba(0,0,0,0);bo=
rder-color:rgb(0,0,0);color:rgb(0,0,0)"><br clear=3D"all"><div dir=3D"auto"=
 style=3D"background-color:rgba(0,0,0,0);border-color:rgb(0,0,0);color:rgb(=
0,0,0)"><div dir=3D"ltr" data-smartmail=3D"gmail_signature" style=3D"backgr=
ound-color:rgba(0,0,0,0);border-color:rgb(0,0,0);color:rgb(0,0,0)"><div dir=
=3D"ltr" style=3D"background-color:rgba(0,0,0,0);border-color:rgb(0,0,0);co=
lor:rgb(0,0,0)">Cheers,<br>Miguel</div></div></div></div></div></div></div>=
</div>

--0000000000004987f70648f81a0c--
