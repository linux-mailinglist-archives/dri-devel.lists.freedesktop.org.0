Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMCyMIZ0fGmAMwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E01B8B6F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5994E10E93E;
	Fri, 30 Jan 2026 09:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dUJ4OEDi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE7110E8A5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 16:42:01 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-8947e17968eso14314776d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 08:42:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769704920; cv=none;
 d=google.com; s=arc-20240605;
 b=hqn2qx4q+zyaFk2T3gBCbNzYneNoOE5McPyL7aA4dvqJl8emLGEfxZpP9XYKFlO5PD
 Vi3AGKJOe4K6g2iARbpDXFdCXqvV2r6uvxW5KTor90MQuHXwrOJdUm23xw8FkLMigCZF
 0x1UTHRuVgQLChd14G25nWjY0V0OgTmNYhVT6DXOj3Vo2Z/WRVWpey11Nm2dAPyV00HR
 0uRF0fLHKK7FhNtvc2iBoYvCelRTPrR28SqyVLWMtaHB9RXj1DcOpw8XjeHcnl2+g39s
 MccBqSXUhtCJFQxvGAtzNdGg2BODBsig4fRaOCSXIwlc7BHk4caFZckz5RropJaI+ReW
 tc1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=UTUVbcd/Q4jnC5ImuUSFgP8oQOyNCkpI89jF1YQHUqo=;
 fh=BiahF60dVAU/XHKZHp1JUhosDayHjshBsYNM2K9I5ao=;
 b=Rs2DFwzW+nFZMJfRO/8umDTfk8oHBOj51TlGp8QqIe+PPdKUvUGposOXrfVHyFprMD
 AyD0ydnlk6GH8xIGoQsi+GkZ/OPCRY9FbAzqGQRCE+tdo8OCd4ZSldBOFuwVrsV2NN+n
 c3KgL9PX7ZQEtT5Pv1JkCSzkeq/6SFw55G6m4uoo19WiLi0WbAwHtsx9izoNWnFKmbY6
 jGqBRUIM77CJ4mGK70cQ7iBvS199iFmpSB23mXeTmlywGQbOByaiPKtEXTdKSugx3zuG
 I9tZ3YXS1sAEc8xLHgK9ig3pim+eobS5q76gyfjtSu9Jd+Q/fdAyVSizRDhvPAdIEOPW
 ez0A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769704920; x=1770309720; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UTUVbcd/Q4jnC5ImuUSFgP8oQOyNCkpI89jF1YQHUqo=;
 b=dUJ4OEDi39mLvT/k5aXlWuI7/z4GEiwVKnQ6hJyS1CIBmLrGxW6gBQm5T4ChI+VzV1
 LpAVYsWpFxlIcMGE3J05E1J98yjHMOsBeCN66vcQvC2VGLukFRufSDCUdY+Nw3aIJCs5
 B9q8Gp7NefNlpJXsg0Akt6E9vstJT6wckbRmu2+cOizPQKnULqSB4CKYYLJ+8/iNeJWQ
 wg67CqULymHhAAOMWEL8mcldO78sY/T7VRi9mBHbU2FV8lTPGXt6dyba+37eGW5bE0P8
 iMFEC7+NYpkUFtBI8ZSqj/75qagdy3XD8CnbYsrMY21R4npPjfALmrNimCbH2Ss2JrcZ
 FnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769704920; x=1770309720;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UTUVbcd/Q4jnC5ImuUSFgP8oQOyNCkpI89jF1YQHUqo=;
 b=JBw6WhTgWbbXWZ/SEXrslhnU4zWPXkUchKEbXiShjmnGfDCwMsTJQKyxDMMbAHFsr3
 di+Th5NYUDM4sgHNaMheknQyXNc8n7deaOwzigQQfzSl5GLHbfgwz0HrI4IAJOB20w8/
 CnEcxF09KLdJzhes3H52iWETairL8qS/wt0iR/mnz1zaQSSFxgp1ZT6maXj/j5PM0cyJ
 pkpCQ1fcwnvZo3oXUF14ffgwSuz2mhVRwvzg178B284gmX3n+wWY1nFjoDW26KQPmXSv
 z24pQB/LSF1AOuDbUSNTIDTkpAXClU3Ak8Zh3+K9lFePy2LY8FSB0XZ8/I8KSe5buRs3
 qL1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN79W1rZmK5QW/iEA/JUs9tfuS0lT7ozFxglHG+0w8h4CiKDXmDoSsKy4C/TdCq6WoO8xkvWNLX+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu3mkrS0Mm1Bep1MGWBASWFps1xF4tcLddhm9jGmQA1VcrEcXx
 NmSpgE8ksnpYE8xGQXyPyMIjWdpKtIKVV5UXjlI11YX3jx0oG1V9VfaVIm/NmojF+kvjzybTBHB
 p8cs+GJc4d4bJbMdt4JoPZxmfnMBhIfw=
X-Gm-Gg: AZuq6aL089HGDFt9oAISTJaE7rnviPOxsM4n7ANtTujHvhWvPP9oIO2Y31ABNrkp7v1
 phXUPpi35SDiskhFm+IJ5nsfRWo5ht4SNAsaEGEAlKJH+fn5Qb/npUQrwDWLuK7AS+P1C8MuUdZ
 ug4QcgrT+7tWoY6gXnto2KCv7DSiDcG4PPqQ0XlOv38fzhK2TSWDmQHUu6pKIqsIvpC/3m88hLA
 silLgcngoUpQOj1KnFnVo7M7l7NZpcu8fVnwOsjqk8FSktvR8BnHrROTDhfso2/VY99HNqh
X-Received: by 2002:a05:6214:765:b0:890:754b:1396 with SMTP id
 6a1803df08f44-894cc9472cemr136001506d6.57.1769704920164; Thu, 29 Jan 2026
 08:42:00 -0800 (PST)
MIME-Version: 1.0
References: <CAFqHKTnSUndwTs-cc8SZxST48UBj6_oKf0Bzt_mMSsj6=g-xww@mail.gmail.com>
 <923ab7ae-0963-472e-995e-760c30978274@amd.com>
 <31babc28-0e69-46e5-94cd-8856e9ad6550@amd.com>
In-Reply-To: <31babc28-0e69-46e5-94cd-8856e9ad6550@amd.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 29 Jan 2026 08:41:48 -0800
X-Gm-Features: AZwV_QgOegN2_JQ1MaXI7zJ3zc-NfBU0ZhSluXQW6M3h8P4l86-IKVydfZW541U
Message-ID: <CAFqHKTmeGC_7FiuU73yCUxkXdQ78Q-6NXT43aHOqBjSE4beUog@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm: Introduce drm_crtc_vblank_prepare()
To: Leo Li <sunpeng.li@amd.com>
Cc: Harry.Wentland@amd.com, airlied@gmail.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, jani.nikula@linux.intel.com,
 simona@ffwll.ch, 
 Mario Limonciello <superm1@kernel.org>, ville.syrjala@linux.intel.com
Content-Type: multipart/alternative; boundary="0000000000001fae9206498989d4"
X-Mailman-Approved-At: Fri, 30 Jan 2026 09:06:10 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sunpeng.li@amd.com,m:Harry.Wentland@amd.com,m:airlied@gmail.com,m:amd-gfx@lists.freedesktop.org,m:jani.nikula@linux.intel.com,m:simona@ffwll.ch,m:superm1@kernel.org,m:ville.syrjala@linux.intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[derekjohnclark@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,lists.freedesktop.org,linux.intel.com,ffwll.ch,kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[derekjohnclark@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 07E01B8B6F
X-Rspamd-Action: no action

--0000000000001fae9206498989d4
Content-Type: text/plain; charset="UTF-8"

Leo,

Appreciate it, thanks

Cheers,
Derek

On Thu, Jan 29, 2026, 08:40 Leo Li <sunpeng.li@amd.com> wrote:

>
>
> On 2026-01-29 10:15, Leo Li wrote:
> >
> >
> > On 2026-01-28 23:43, Derek John Clark wrote:
> >>> From: Leo Li <sunpeng.li@amd.com>
> >>>
> >>> Some drivers need to perform sleepable operations prior to enabling
> >>> vblank interrupts. A display hardware spin-up from a low-power state
> >>> that requires synchronization with the rest of the driver, for example.
> >>>
> >>> To support this, introduce a DRM-internal drm_crtc_vblank_prepare()
> >>> helper that calls back into the driver -- if implemented -- for DRM to
> >>> do such preparation work before enabling vblank.
> >>>
> >>> v3:
> >>> * Unexport drm_crtc_vblank_prepare() and make it DRM internal
> >>> * Drop warnings in drm core for vblank_prepare(), drivers can do so in
> >>>  their implementations
> >>> * Drop unnecessary crtc null checks
> >>> * Check for drm_dev_has_vblank()
> >>> * Rebase on latest drm-misc-next
> >>>
> >>> v4:
> >>> * EXPORT function to fix build error on DRM_KMS_HELPER=m
> >>>
> >>> Signed-off-by: Leo Li <sunpeng.li@amd.com>
> >>
> >> Hi Leo.
> >>
> >> I wanted to know what branch this series applies to. I'm trying to
> >> troubleshoot a possible vblank issue on the Legion Go 2 and was
> >> pointed towards this patch series. Unfortunately I can't get it to
> >> apply cleanly to drm/drm-fixes, drm/drm-next or stable/linux-6.18.y
> >
> > Hi Derek,
> >
> > This applies to drm-misc-next, here:
> > https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/drm-misc-next
> >
> > Thanks,
> > Leo
>
> FYI, in case you run into the same issue, I had to blacklist my wifi
> driver:
> modprobe.blacklist=mt7925e in my kernel cmdline for drm-misc-next to boot.
>
> -Leo
>
> >
> >>
> >>
> >> From commit 15392f76405ecb953216b437bed76ffa49cefb7b (HEAD,
> >> drm/drm-next, drm/HEAD):
> >> $ b4 shazam
> https://lore.kernel.org/dri-devel/20260127194143.176248-1-sunpeng.li@amd.com/
> >> Grabbing thread from
> >>
> lore.kernel.org/all/20260127194143.176248-1-sunpeng.li@amd.com/t.mbox.gz
> >> Checking for newer revisions
> >> Grabbing search results from lore.kernel.org
> >> Analyzing 2 messages in the thread
> >> Analyzing 0 code-review messages
> >> Checking attestation on all messages, may take a moment...
> >> ---
> >>   [PATCH v4 1/2] drm: Introduce drm_crtc_vblank_prepare()
> >>   [PATCH v4 2/2] drm/amd/display: Implement prepare_vblank_enable
> callback
> >>   ---
> >>   NOTE: install dkimpy for DKIM signature verification
> >> ---
> >> Total patches: 2
> >> ---
> >> Applying: drm: Introduce drm_crtc_vblank_prepare()
> >> Applying: drm/amd/display: Implement prepare_vblank_enable callback
> >> Patch failed at 0002 drm/amd/display: Implement prepare_vblank_enable
> callback
> >> error: patch failed:
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c:277
> >> error: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c: patch
> >> does not apply
> >>
> >>
> >> Thanks,
> >> Derek
> >
>
>

--0000000000001fae9206498989d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Leo,=C2=A0<div dir=3D"auto"><br></div><div dir=3D"auto">A=
ppreciate it, thanks=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Cheers,</div><div dir=3D"auto">Derek</div></div><br><div class=3D"gmail_=
quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Jan 29, 2026, 08:40 Leo Li &lt;<a href=3D"mailto:sunpeng.li@amd.com">sunpen=
g.li@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 2026-01-29 10:15, Leo Li wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 2026-01-28 23:43, Derek John Clark wrote:<br>
&gt;&gt;&gt; From: Leo Li &lt;<a href=3D"mailto:sunpeng.li@amd.com" target=
=3D"_blank" rel=3D"noreferrer">sunpeng.li@amd.com</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Some drivers need to perform sleepable operations prior to ena=
bling<br>
&gt;&gt;&gt; vblank interrupts. A display hardware spin-up from a low-power=
 state<br>
&gt;&gt;&gt; that requires synchronization with the rest of the driver, for=
 example.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; To support this, introduce a DRM-internal drm_crtc_vblank_prep=
are()<br>
&gt;&gt;&gt; helper that calls back into the driver -- if implemented -- fo=
r DRM to<br>
&gt;&gt;&gt; do such preparation work before enabling vblank.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; v3:<br>
&gt;&gt;&gt; * Unexport drm_crtc_vblank_prepare() and make it DRM internal<=
br>
&gt;&gt;&gt; * Drop warnings in drm core for vblank_prepare(), drivers can =
do so in<br>
&gt;&gt;&gt;=C2=A0 their implementations<br>
&gt;&gt;&gt; * Drop unnecessary crtc null checks<br>
&gt;&gt;&gt; * Check for drm_dev_has_vblank()<br>
&gt;&gt;&gt; * Rebase on latest drm-misc-next<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; v4:<br>
&gt;&gt;&gt; * EXPORT function to fix build error on DRM_KMS_HELPER=3Dm<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Leo Li &lt;<a href=3D"mailto:sunpeng.li@amd.com=
" target=3D"_blank" rel=3D"noreferrer">sunpeng.li@amd.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Hi Leo.<br>
&gt;&gt;<br>
&gt;&gt; I wanted to know what branch this series applies to. I&#39;m tryin=
g to<br>
&gt;&gt; troubleshoot a possible vblank issue on the Legion Go 2 and was<br=
>
&gt;&gt; pointed towards this patch series. Unfortunately I can&#39;t get i=
t to<br>
&gt;&gt; apply cleanly to drm/drm-fixes, drm/drm-next or stable/linux-6.18.=
y<br>
&gt; <br>
&gt; Hi Derek,<br>
&gt; <br>
&gt; This applies to drm-misc-next, here:<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/drm-m=
isc-next" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.fr=
eedesktop.org/drm/misc/kernel/-/tree/drm-misc-next</a><br>
&gt; <br>
&gt; Thanks,<br>
&gt; Leo<br>
<br>
FYI, in case you run into the same issue, I had to blacklist my wifi driver=
:<br>
modprobe.blacklist=3Dmt7925e in my kernel cmdline for drm-misc-next to boot=
.<br>
<br>
-Leo<br>
<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; From commit 15392f76405ecb953216b437bed76ffa49cefb7b (HEAD,<br>
&gt;&gt; drm/drm-next, drm/HEAD):<br>
&gt;&gt; $ b4 shazam <a href=3D"https://lore.kernel.org/dri-devel/202601271=
94143.176248-1-sunpeng.li@amd.com/" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://lore.kernel.org/dri-devel/20260127194143.176248-1-sunpeng.=
li@amd.com/</a><br>
&gt;&gt; Grabbing thread from<br>
&gt;&gt; <a href=3D"http://lore.kernel.org/all/20260127194143.176248-1-sunp=
eng.li@amd.com/t.mbox.gz" rel=3D"noreferrer noreferrer" target=3D"_blank">l=
ore.kernel.org/all/20260127194143.176248-1-sunpeng.li@amd.com/t.mbox.gz</a>=
<br>
&gt;&gt; Checking for newer revisions<br>
&gt;&gt; Grabbing search results from <a href=3D"http://lore.kernel.org" re=
l=3D"noreferrer noreferrer" target=3D"_blank">lore.kernel.org</a><br>
&gt;&gt; Analyzing 2 messages in the thread<br>
&gt;&gt; Analyzing 0 code-review messages<br>
&gt;&gt; Checking attestation on all messages, may take a moment...<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0[PATCH v4 1/2] drm: Introduce drm_crtc_vblank_prepare(=
)<br>
&gt;&gt;=C2=A0 =C2=A0[PATCH v4 2/2] drm/amd/display: Implement prepare_vbla=
nk_enable callback<br>
&gt;&gt;=C2=A0 =C2=A0---<br>
&gt;&gt;=C2=A0 =C2=A0NOTE: install dkimpy for DKIM signature verification<b=
r>
&gt;&gt; ---<br>
&gt;&gt; Total patches: 2<br>
&gt;&gt; ---<br>
&gt;&gt; Applying: drm: Introduce drm_crtc_vblank_prepare()<br>
&gt;&gt; Applying: drm/amd/display: Implement prepare_vblank_enable callbac=
k<br>
&gt;&gt; Patch failed at 0002 drm/amd/display: Implement prepare_vblank_ena=
ble callback<br>
&gt;&gt; error: patch failed: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_=
dm_crtc.c:277<br>
&gt;&gt; error: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c: pat=
ch<br>
&gt;&gt; does not apply<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt; Derek<br>
&gt; <br>
<br>
</blockquote></div>

--0000000000001fae9206498989d4--
