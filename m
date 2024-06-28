Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA4791C50E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 19:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A44610E094;
	Fri, 28 Jun 2024 17:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZqHwdn6c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD83B10E094
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 17:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719596418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SP48UMwRjN/EBU8LVvAPVSE3bd+HHCSeXFaARhB6zhU=;
 b=ZqHwdn6crHI3hzAtarCMqPh0blHFCeTa1zrEqjPhiipLrubhxsF84v2xQpn2WfbkmEA/07
 kisPycAZEnBxZKnuGh1v4GYPJMUuV0vsc3SnZmUIPD94E8UbYJ4gRNM/cqcqBIdL0WgBTT
 pLXSiqxytI9WKJgBI66J2T9clXGBQsk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-GKpnK30TOq24XhJKLjTCJQ-1; Fri, 28 Jun 2024 13:40:17 -0400
X-MC-Unique: GKpnK30TOq24XhJKLjTCJQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-44645ec39d4so11725251cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 10:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719596416; x=1720201216;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SP48UMwRjN/EBU8LVvAPVSE3bd+HHCSeXFaARhB6zhU=;
 b=jxJ/jykSXHJv0LoHBmsvIs78Bd+IMUl78iNPUYpXy5JxiOapCj3aPtPNshNDpZFN4u
 sUzPhkQgK23MPIhhEXWvBhi/5kCUW8JmEgysRpX82CQOkLbf4d5ZKDbxCU2ktFGK0Bu0
 9jVLcDET5E6XeUik2Y+CkjNlD1R0Ihelr2PMBjJTOiTf/XgK7p1CI5k+nKWNb7njccOz
 HsHAALblzS6vcdYLdme0zxYkZ4VKVDYbtfXrXOYDokEecY88lKNU5fGLNM9rDtwkgvp8
 BtKBwCo6BcMfV0puaKYAFPtz36efpp/Q+Ukq0tIxuLk5eRcjiRSeyLGRKA0beePmtUri
 e1oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8D33ilTRTP0dwHg6qqdlCgGB0CfRu3EHyFvYpGpRYZieZko8ZLGOEPJZntldlOtOZyBa10LZv+BIaLHCDA60HcRNvmabfiLmtf91oUabj
X-Gm-Message-State: AOJu0YzY67NgKjllirEMLnVEXshi21cNEfQQ0oOuN8hhWvgOd8bjACDH
 cNY932q1b45W1MRFpxAk+1m+x3022gCiefEWi/O3L/kdFRV23weeqztn+ccWcJuqOz5Tu82lqbQ
 9cWur7oAm957D3Z7EmjdPp7d3GcmIsXkvMVbk0F+mp0u4ZY5l2JIttSgf3InfaX1fiQ==
X-Received: by 2002:a05:622a:1aa1:b0:446:4749:88aa with SMTP id
 d75a77b69052e-4464749894emr59113141cf.32.1719596416669; 
 Fri, 28 Jun 2024 10:40:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlk4mMP1ndQUm6VugscFP6Lg5KMqYcxhuueZsOuz4e2OVo+yEy7Ux31iC4UszjGEQFeRcEbQ==
X-Received: by 2002:a05:622a:1aa1:b0:446:4749:88aa with SMTP id
 d75a77b69052e-4464749894emr59112891cf.32.1719596416334; 
 Fri, 28 Jun 2024 10:40:16 -0700 (PDT)
Received: from chopper.lyude.net ([2600:4040:5c4c:a000::789])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44651498178sm8840761cf.60.2024.06.28.10.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 10:40:15 -0700 (PDT)
Message-ID: <9004911c3b8c44afecb354db736f4d7d84c0cf19.camel@redhat.com>
Subject: Re: [PATCH 2/3] drm/dp_mst: Skip CSN if topology probing is not
 done yet
From: Lyude Paul <lyude@redhat.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Cc: "jani.nikula@intel.com" <jani.nikula@intel.com>, "imre.deak@intel.com"
 <imre.deak@intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Date: Fri, 28 Jun 2024 13:40:14 -0400
In-Reply-To: <CO6PR12MB5489CB4E5CFB71CF8E812BEEFCD72@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20240626084825.878565-1-Wayne.Lin@amd.com>
 <20240626084825.878565-3-Wayne.Lin@amd.com>
 <7da3ccf156a858c1a7d2691fbedfa7aa2ceccdf7.camel@redhat.com>
 <CO6PR12MB5489CB4E5CFB71CF8E812BEEFCD72@CO6PR12MB5489.namprd12.prod.outlook.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Thu, 2024-06-27 at 09:04 +0000, Lin, Wayne wrote:
>=20
> I understand your concern. My patch will just check whether mst
> manager starts
> the probing process or not by confirming whether we sent LINK_ADDRESS
> to
> the 1st mst branch already. It will drop the CSN event only when the
> event comes
> earlier than the probing. The CSN events occur during topology
> probing should
> still have chance to be handled after probing process release the
> mgr->probe_lock
> I think. Does this make sense to you please? Thanks!

Yeah - that seems like the perfect solution :), sounds good to me

>=20
> > > =C2=A0=C2=A0=C2=A0 } else if (up_req->msg.req_type =3D=3D
> > > DP_RESOURCE_STATUS_NOTIFY) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
nst struct drm_dp_resource_status_notify *res_stat
> > > =3D
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &up_req->msg.u.resource_stat;
> >=20
> > --
> > Cheers,
> > =C2=A0Lyude Paul (she/her)
> > =C2=A0Software Engineer at Red Hat
>=20
> --
> Regards,
> Wayne Lin
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

