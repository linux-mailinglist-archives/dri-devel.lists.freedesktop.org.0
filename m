Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKJmAMsgeGk/oQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 03:19:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E48B8EF4C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 03:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E580110E090;
	Tue, 27 Jan 2026 02:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cTTUrqUJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B4010E090
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 02:19:49 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-35334ea1f98so2335998a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 18:19:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769480388; cv=none;
 d=google.com; s=arc-20240605;
 b=EPvycLGz2PYFHjJEQDWTgFIJtq6Un09e5ArGKLXy6Szt28EaFV/socpZiYtF4fYqE+
 97LLhhbTDGAgKmaCnZ/igLdpN0WMXsF0hyxLL1zJDJLZ3Zk99+GQJbjO+lld/E+DNrjO
 wy8ay8xRX/a6Lk8RXlbsm0LaxuobeRNc7CX4Osq3qwSf5GrZ6yZHmrltP4ewl5u/NFtx
 3v/NWtyPAhq9o9r12aXJrVO2gv0EPucqz755x6eLMylcfjEelVTvRhzPlBlvqMQjHQAX
 aGk7RVA0Dg4C+HlaUtrEERUPhpSvftvwC8oTPQ4qRLpNanLm4TPAiZ7oTTaEzpnsCgcY
 D+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=7AuGSERLo4VW5sSrWHTOA9xALg2QwcEpABcfv80mNKA=;
 fh=MBjrIypxrf1Bce/HoCBqrdC4tX61HFCM/gtRVr1JqOM=;
 b=HiAkybYZ2ptMjUsH+wsvXU4O1VhL3/Ot8ZFor5UyIGeIdc6UPye7D3ID/hES83khdp
 9Ly1CdKn86PSb8NeJjVLo5fvQbno7Opmh6Sm9s/QgZiuAGRFFnppUKe885MGqJP+iUL3
 5IY6/BIjqhU+w19tnByXLlIFQGt9BV4uhwb5j2IpfZbfrnCDMawkaccCm2BD2pI11SyC
 0dZy/MuGhglbpa/yp0785Iv7OkO8Q9ubT8FEQ0OKTe4DsHHTffqlruGYSpzoo+1Yhbkj
 6qrlphsv/fNQxYeF+ZcUkqUf5JdZl9zLg0FNZKZ/L2NDvsRu9zqvtu9KKuP/OrAisFLV
 TzOw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769480388; x=1770085188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7AuGSERLo4VW5sSrWHTOA9xALg2QwcEpABcfv80mNKA=;
 b=cTTUrqUJUK0cVndNPa2lRFG2cdc7h6e/Z6R8WW612+UIrJjn6zO+bvT5HXplgW0iz6
 +LkhnyUMS1kDVutU5EWeUtsRyc9rYfugKSG/ndezQh2HbZvaZfkhTlG9ATmVmMN4rW8b
 V9NoIiYhb53dJ4RnTKuUGIMg3UZFIvKrcbNJ+RvP+okLvJu4NulzvQminULeCZiViPHB
 ai1jYjbu3FrviJYqHngFuroPfoecJe58C6CYutI9Ow5757hH43l3YHSm/PD3nlA+Pf5O
 mxz1F6ByOuSmXC8VD0CDrPC4I6RDlxO8OMKSG+eE8dj1ZH2NIYx4Bknhe/hjttB6u0ng
 EumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769480388; x=1770085188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7AuGSERLo4VW5sSrWHTOA9xALg2QwcEpABcfv80mNKA=;
 b=eSsTqeTMLYGUkDeUQQz72Y9RR3T1jWh5SWDrrB6u0JXdWxzeVGG2rxi+FMuQVrYbe3
 YImWfn4BvXz6RLNmSOYyI0X284x3DCo1GUsW33Gr5SHeRLQGMRUEqVAP5GRaSuJOD4q1
 USbPJuLJLzWKhh0dKaLGl+it5wPuPZo1RWgBaJkoJF9/OwBWWZBeswwiAt8hrbgKXn2X
 uUtZiyp+3xBSwhkLNer7S5YZsNWz9MpLBaIGTnyKCvGnQ2KjS2/nMnOT712orAKG2UUs
 SHikqs4rwMQKpR1f1Bo+CksXdMAD6ifoqItepsK7A+wZFYa5JGkilMn9BDTJnNzqfrw7
 P2MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMZ+LA0X3gOn5PhkygEf460s13/byuweN/SKpAjU3cGokZx7aNHNVzqf/m8y8woMFQ2SKIRyqTTX0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+HI8fK60pf8cuDFEuZ0ma4sl9vyO+anIjYuh+rEBJeVgQR21j
 dHAMCSagYDmZmo4cDUNMMEcBRQr8imyj9nUmGstQoBCruYJOtW18OkSrFzbzhhuTrHu/q0Ii7e8
 Ann4lrOx1eRXbgub6j4sW1CQQlvf+O4o=
X-Gm-Gg: AZuq6aK7LbBY/HHCQ7JR+IjCgttBar4LtS2hb68+WwYtIWcQ58QOBh0jSwb83hmoP8M
 Ytq4mJOA7/i3HQE9YwpIRm/XUS7i7VOR5TsQ9xehvkF7pp7B6yqQ9oWeumzfY7KvWNTGrAsCfeY
 B1Wy2U0Fe3I31Q8MyfemyVgKW1dVYLq8+h7ImofPrPnp8FEYHgwxPLJbv4Sh5dsDZPI/uMv0eJX
 RlxieuJXJAbrN1UFcFFO/aSVwa+1+xq3NnDKKfSq0Hky6+cixbHhSRbnMNWShFLLrrK0R0o07I7
 U/ks
X-Received: by 2002:a17:90b:35c4:b0:341:8ad7:5f7a with SMTP id
 98e67ed59e1d1-353fed74b59mr262004a91.18.1769480388288; Mon, 26 Jan 2026
 18:19:48 -0800 (PST)
MIME-Version: 1.0
References: <20260117140351.875511-1-xjdeng@buaa.edu.cn>
 <2026012631-suffice-enforcer-8553@gregkh>
 <qbuccwnfljpnxvpp7vl4weoecx6ujg3cy2lwwgoz42b3ux5o3k@mi5fxhplgrt7>
In-Reply-To: <qbuccwnfljpnxvpp7vl4weoecx6ujg3cy2lwwgoz42b3ux5o3k@mi5fxhplgrt7>
From: Xingjing Deng <micro6947@gmail.com>
Date: Tue, 27 Jan 2026 10:18:38 +0800
X-Gm-Features: AZwV_Qgc7eQOJipl3o8vcuglbFoKSmgdRMS1oOVCwrdajZx_HYCkl-uUukOkTHc
Message-ID: <CAK+ZN9r+oCbSNjSf=yKQHGT9=Cqfw02J+TS3eZaUgrd=PfV7tA@mail.gmail.com>
Subject: Re: [PATCH v5] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, srini@kernel.org,
 amahesh@qti.qualcomm.com, 
 arnd@arndb.de, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: micro6947@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xjdeng@buaa.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[micro6947@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[micro6947@gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4E48B8EF4C
X-Rspamd-Action: no action

I identified this issue through static program analysis. All other
callers of this function validate its return value, so I believe a
validation check should also be added here.

Bjorn Andersson <andersson@kernel.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8827=
=E6=97=A5=E5=91=A8=E4=BA=8C 04:53=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jan 26, 2026 at 04:24:55PM +0100, Greg KH wrote:
> > On Sat, Jan 17, 2026 at 10:03:51PM +0800, Xingjing Deng wrote:
> > > In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> > > reserved memory to the configured VMIDs, but its return value was not
> > > checked.
> > >
> > > Fail the probe if the SCM call fails to avoid continuing with an
> > > unexpected/incorrect memory permission configuration.
> > >
> > > The file has passed the check of checkpatch.
> > >
> > > Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool acces=
s to the DSP")
> > > Cc: stable@vger.kernel.org # 6.11-rc1
> > > Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> > > ---
> > > v5:
> > > - Squash the functional change and indentation fix into a single patc=
h.
> > > - Link to v4: https://lore.kernel.org/linux-arm-msm/2026011637-statut=
e-showy-2c3f@gregkh/T/#t
> > >
> > > v4:
> > > - Format the indentation
> > > - Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72=
itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t
> > >
> > > v3:
> > > - Add missing linux-kernel@vger.kernel.org to cc list.
> > > - Standarlize changelog placement/format.
> > > - Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2=
ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
> > >
> > > v2:
> > > - Add Fixes: and Cc: stable tags.
> > > - Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.40=
29635-1-xjdeng@buaa.edu.cn/T/#u
> > > ---
> > >  drivers/misc/fastrpc.c | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index fb3b54e05928..d9650efa443f 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -2338,8 +2338,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_de=
vice *rpdev)
> > >             if (!err) {
> > >                     src_perms =3D BIT(QCOM_SCM_VMID_HLOS);
> > >
> > > -                   qcom_scm_assign_mem(res.start, resource_size(&res=
), &src_perms,
> > > -                               data->vmperms, data->vmcount);
> > > +                   err =3D qcom_scm_assign_mem(res.start, resource_s=
ize(&res), &src_perms,
> > > +                                   data->vmperms, data->vmcount);
> > > +                   if (err) {
> > > +                           dev_err(rdev, "Failed to assign memory ph=
ys 0x%llx size 0x%llx err %d",
> > > +                               res.start, resource_size(&res), err);
> >
> > Shouldn't the caller function report the error?
> >
>
> That is correct, all codepaths through qcom_scm_assign_mem() will either
> be -ENOMEM or print an error message, so we shouldn't print yet another
> message in the log here.
>
> (The usefulness of the error message in qcom_scm_assign_mem() could
> certainly be improved, but that's a separate matter/patch).
>
> > How as this found and tested?
> >
>
> Looking forward to Xingjing's answer here.
>
> But failing to handle errors here means that we're ignoring the failure
> to map memory to the DSP, which will fail us later. So, that part is
> correct. Exiting through err_free_data looks good as well.
>
> Regards,
> Bjorn
>
> > thanks,
> >
> > greg k-h
> >
