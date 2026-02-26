Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJOsDtR6oGmMkAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:54:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922601AB52D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1293110E9D4;
	Thu, 26 Feb 2026 16:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bsecA1zQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com
 [74.125.82.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3182D10E9D4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 16:54:39 +0000 (UTC)
Received: by mail-dy1-f170.google.com with SMTP id
 5a478bee46e88-2bd801b40dbso84822eec.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772124878; cv=none;
 d=google.com; s=arc-20240605;
 b=LKlisZhIVqjC3rf5MTE+Ns8YmlluWOWj6ii6r3A1bgQ2GfcggnbQPe6qao52Uv3PUm
 EXvbksMhth/tU9hhjizefi6lC/eVGF+sGPJuPxN6DmAxLGJtemtWSliWEg86djtbv4yS
 Ce15+/DIfsYERReAzQ1yymKicV7Erw3nDSct2KlwzT4lOiR04sRneHdB5k/0VxdDuFgv
 2e5y7SPGup9PdYUKiFQmKnNKkdXVQDit/n1GEihqFbzsscfhtjk1R35XrdL6yaHlLIS6
 WwpYmfyKOAC72LbGs8sTn5lAXvj4A6vSRnoqmEgQNqHq0DA7gzF1wRd0tXf0org+j2l2
 X/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Up3sT8qjuR5kM0SPkhMO2u8EAJVJK4TECaFQv8JLTOM=;
 fh=Au8kAT8cPhqrjplqZDDVqAy4U35S9xiFYxDOSuj0vdU=;
 b=HNRGLLI0vZIYdm1qoKgk+d0PJoWo6gzHYfka9sOHu3GpcefST6ix7EFkDIxAHvphiq
 XwA//UDpfhrEzpQb5f+S7EYoOfrTIbYM3vm6Bbgsb7EKjl4yLs7+JjR7kiWeeYEujv22
 79U2iXpmjlY/Bqvdr16PJgGgMqmSCWAlG8jxYyxvYtZyEGjVm78ZvJMWfiU/7SBRvkkn
 jSj/YxVY5tw8ISoEZfILNiBC3iVJFsWggZb+uufAVyUDMrUKM2bHI3s+gNkHEehDp7iB
 5V2OXKG+kql41fD16w0quRFQ3In42YDmJxXX8nmEr7jnQ3I1yFwzLB2CmgaGad4d9z9w
 5ZiQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772124878; x=1772729678; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Up3sT8qjuR5kM0SPkhMO2u8EAJVJK4TECaFQv8JLTOM=;
 b=bsecA1zQKJaORF7opFUhwDHK8/F5CmhDrs4cMTf8kCB/Qd9A7IO3ubFjBuRBOk+0IE
 ETXIJ7lumShjWf0huZt4fzbO2tHzY47qsoiOXMcSWqV8LBikPRGIsqsnoRAS5koi1QcH
 onPd7O5VOlch3YfSjmt6/BZjlH7Sq711fOgeXsvueGaiYsXDOB+FTQucZGY/ITlzeihK
 M0/xlWEjJ6idR4Ecx0HDt4RQ2CDm9/QC1R4KFDVjBdJu3/dLNfNhtC3/feu+LwXwE3us
 AB/A3VIayIWQmSAYxE/SsiDLJ01DQeFcW8+3YgPOcjhWpXbhIHRIOPKer0dLB3kzITPz
 FhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772124878; x=1772729678;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Up3sT8qjuR5kM0SPkhMO2u8EAJVJK4TECaFQv8JLTOM=;
 b=Y/IK+mEtH+VJBIB+sKywSDH2Gjsa0iOe079AfiGrSmNi8MSEIRKIV5QKdRysdlbVfX
 oWpbEYjGtoacTjyxpYs4aB1R/lEHJo8p9PBZ9144M3842xD98fvMM0nxcyTTTG7stxia
 5Y8yLpVt29e/KgqrVsmHLYx+VEAVpgPw+Y/L5ECazxUK5OT5i9atzncCBPcEIQEKSaa1
 tlSrlvpjQ5CxXo2tFc76ipusYwtpnVUwH6O/iIOclZ43z/avB1dCTE3Mmx9s80rtULpI
 tT0SXOPA6meAjIyU42wBzaioMi+a4nMgkQxma8mCRwUBWZP5ZfUCTDEbcTP/psvK5JgE
 CBXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgngxodrwf2ix3oV5f5aleKnHcUryKPCIYPMmETI0fmvnpyn4UApgON8zbDvS/oPVPx5E09vIBpN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqipuXyckEKzS25bT+wWIi8f7q+OOAdorb60EY1ayOXUYTZ0ra
 BgJ5hmcYeF7NsNlgu1gXHVcXXgg6oGCM20+ZqzbsUmU2hB5bQDLoqbTsZTsxZ3G47RM3tbHOJ57
 RrCAsJ33VfGJmQW1HyYZnqn1nwbZSUE4=
X-Gm-Gg: ATEYQzzwvBcDfSuNV0JjhTTwRuyfiGMEgm1ybKUCoRmygGLOHSBMjg/6tJabAOB4hnj
 jEF0ddhC8+kSbrhX9TyoUO/U4Gsgx8Lr8oJ4QapKqYXmjcBxxUABqiNVnhNfNepSKLaYXLZvdCX
 qgsIn6f+jq4xEX3x9t+S8QWVMCcUvezaLSfxW1Bw8C1St+q8Zsq/FLnNoB5QVRN+H+2a6XoB2Bk
 pZSDsKxizH08cCEyp/DC1MxCu/ODahqDFMR5c9xxKV7Qg4g5JIOZ0ieAmY8TC9cX8lJJvc3GQfs
 yYHDfboK8z+VICBBT6jZJHjzhAIBre9KYNp4ifaGGTPasPRABA8i6LmNLziCSPk2f3hE8g==
X-Received: by 2002:a05:7022:f005:b0:11a:43fb:58dd with SMTP id
 a92af1059eb24-1276ad3bcd8mr3975440c88.5.1772124878272; Thu, 26 Feb 2026
 08:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20260226030038.1182961-1-yujie.liu@intel.com>
 <20260226030038.1182961-7-yujie.liu@intel.com>
In-Reply-To: <20260226030038.1182961-7-yujie.liu@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 26 Feb 2026 11:54:26 -0500
X-Gm-Features: AaiRm50FIm7gW9ftKbXM9mUDFZF-JB2g7m56NgkO01zsGUV36mqPkWnCPIpQdvQ
Message-ID: <CADnq5_N819Zv-dQU_rswGDBdt7wKB+fCgFDLswbLgbwhz6J2Sg@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/amd/pm: fix kernel-doc warning for
 smu_msg_v1_send_msg()
To: Yujie Liu <yujie.liu@intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kenneth Feng <kenneth.feng@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
 Asad Kamal <asad.kamal@amd.com>, Yang Wang <kevinyang.wang@amd.com>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>, 
 Gangliang Xie <ganglxie@amd.com>, Candice Li <candice.li@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Luben Tuikov <luben.tuikov@amd.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:yujie.liu@intel.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kenneth.feng@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:patrik.r.jakobsson@gmail.com,m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:pierre-eric.pelloux-prayer@amd.com,m:srinivasan.shanmugam@amd.com,m:tvrtko.ursulin@igalia.com,m:sunil.khatri@amd.com,m:lijo.lazar@amd.com,m:asad.kamal@amd.com,m:kevinyang.wang@amd.com,m:Hawking.Zhang@amd.com,m:tao.zhou1@amd.com,m:ganglxie@amd.com,m:candice.li@amd.com,m:YiPeng.Chai@amd.com,m:matthew.auld@intel.com,m:luben.tuikov@amd.com,m:ville.syrjala@linux.intel.com,m:michal.winiarski@intel.com,m:michal.wajdeczko@intel.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:intel-xe@lists.freedesktop.org,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,igalia.com,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 922601AB52D
X-Rspamd-Action: no action

Applied.  Thanks!

On Wed, Feb 25, 2026 at 10:19=E2=80=AFPM Yujie Liu <yujie.liu@intel.com> wr=
ote:
>
> Warning: drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:415 expecting p=
rototype for smu_msg_proto_v1_send_msg(). Prototype was for smu_msg_v1_send=
_msg() instead
>
> Fixes: 4f379370a49c ("drm/amd/pm: Add smu message control block")
> Signed-off-by: Yujie Liu <yujie.liu@intel.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c b/drivers/gpu/drm/amd=
/pm/swsmu/smu_cmn.c
> index 6fd50c2fd20e..c471c0e2cbd1 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> @@ -405,7 +405,7 @@ static int __smu_msg_v1_ras_filter(struct smu_msg_ctl=
 *ctl,
>  }
>
>  /**
> - * smu_msg_proto_v1_send_msg - Complete V1 protocol with all filtering
> + * smu_msg_v1_send_msg - Complete V1 protocol with all filtering
>   * @ctl: Message control block
>   * @args: Message arguments
>   *
> --
> 2.43.0
>
