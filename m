Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3602668C5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 21:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE69F6E079;
	Fri, 11 Sep 2020 19:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322936E079;
 Fri, 11 Sep 2020 19:30:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjeczuIvFw7CJCWhvs34tWwWLUoTXJuj4m5ji1emRIupPngCSoVJ/KjyRLU7F0vfAKp5UlsLYdte4/DyXF0VVsQBad3LXkiY1/KJIC1Us5WE6TVFVZIY61w9cRaERmPINFiGQ7DjudBveZcyX3MsGtH2vgy2l8YJDSXKcHc7t9/kJzPN+hGAtJs308QkRMYxZHjmzcry7RWcvB3aalBZEL7Jmn69+R9DIdq33FZmcB0cTwxlJoNgq9W5bi1Yg6EzfWVj8pm3FRR+7ixBxmbfIf1YqE/cXu0OLpXkns31EspEPAOJdFNE322ZYyZ9Ncs9T9EaAOmhiGoauNmQJeW5CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZGj3vyKDtaka86kisfwIV8xTj14I3TC7kDq7/flJeU=;
 b=b43SSYteQznzXEBi9gN3Uhs9KF5tdUb9jIrpl0F8Ck+AlC44z6ZZ0PdGnNJ7tM5x0kEq+XXAFn5dXff+tf9f1/1oQ5KKK+VwhLnH5NXEAI92iSHJuHyUxaAs8bU+2dbh1kF1fwyttlVwiq3cggzA2UiOIwTh9qUTqztSR/heDxBSA927JIyAH17YV4p1c24A3wx/KRyt720e+19+N+7j/FjjhvXLx51n/7NG2uU3RftCJqzPu2ycqCW3vrPiNmm7KQdPgLEvTtl0MOfmknZyxhyWp1NbLBcKL8BQTrg74bi5T+lNxsYVwIYhcwYBpz4UhSEVYlnwwdOPW313jK8PQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZGj3vyKDtaka86kisfwIV8xTj14I3TC7kDq7/flJeU=;
 b=DP9N+uiTHaLKziGEHicvFQCQvZpN+k/K5jDY0F4Bek4czcdy4XgmdY9XYVNZ+39Bs5Tn/6Fc/3LUDFj3eGGdyECEqUW7dUrXtV8HbQJQDHKzfb+FzTTZYoVaxyY7qtLTXl32c8bdVfk5H8cnYGA9L2mjgiyYVJ3AEZZKQqNn9m8=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM6PR12MB3963.namprd12.prod.outlook.com (2603:10b6:5:1cd::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 19:30:11 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e%8]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 19:30:11 +0000
Date: Fri, 11 Sep 2020 15:29:58 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Subject: Re: [PATCH v2 3/4] drm/amd/display: Add pipe_state tracepoint
Message-ID: <20200911192958.pqgvj3rez35cq3xk@outlook.office365.com>
References: <20200911145927.401322-1-Rodrigo.Siqueira@amd.com>
 <20200911145927.401322-4-Rodrigo.Siqueira@amd.com>
 <e70b5c24-ece8-c989-7058-890e51bc6ae1@amd.com>
In-Reply-To: <e70b5c24-ece8-c989-7058-890e51bc6ae1@amd.com>
X-ClientProxiedBy: YTXPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::24) To DM6PR12MB4124.namprd12.prod.outlook.com
 (2603:10b6:5:221::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60::e9a1) by
 YTXPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.15 via Frontend Transport; Fri, 11 Sep 2020 19:30:11 +0000
X-Originating-IP: [2607:fea8:56e0:6d60::e9a1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5a30c589-23a4-41dd-9b6b-08d8568919b3
X-MS-TrafficTypeDiagnostic: DM6PR12MB3963:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3963B5F4256E431DA377FBBF98240@DM6PR12MB3963.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VmfkRyXv9bKQISGXUQIPPLp6SIqaQ/MmDYCV3e1769PBuI3d6C5Kfmgz+KS/3g92Zbb9IhuE8FnouOcO91YpIuXCyOgu3Wvfkbo912fP3Nj6ZySDxSpsPKVlZjFQuce6/gn9XfJ3CB/mRq6NxnIPo1pz7PG1/s+7JPQ2NIQXzamKSkiQxSYsqXX+EMVpRlu5VVPaEe8aSeH3/+FgKMe2tCkV8WFV7jVdSU7IgQ/ZfuJwXgSr6KjdEJEImV+deiXYMOq+wv+wUR3LItAzhyQCO9fL7aMTDDT9wTIb1JdceQ8aTyZeC9xNSirEarRO7kNdkhYGchxwzxpyYHG9QwgEU1/3qEQ+NJiBU79r94Cx4Gzd7WdzcmyuABNsW4i8PnJSqOGaM0fqZ2nE36z9eSvDp4VL7BDvfMgAPZ6Ch16hhruJJclle/bts/bcRPlhMtrSTmMULKCvNNLjwIxETdl+5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(52116002)(30864003)(4326008)(2906002)(55016002)(66476007)(7696005)(6506007)(53546011)(6862004)(6636002)(966005)(450100002)(9686003)(66556008)(44144004)(86362001)(478600001)(186003)(21480400003)(6666004)(66946007)(1076003)(54906003)(316002)(8936002)(16526019)(83380400001)(8676002)(5660300002)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: es1+ZoODbkt+x0CGeH5GfGxdjEJNp6R2MCkQ3vkKSwacDfsfL8uj5uC8Chc2j34wcNn/NlXgaZNgeHxeHJ9VZ3TIQbk13uCBJNzaztDgQMemtrXVBTG71KM8Kq5WQiAQrpfNHl/JbnNay8NtkapYuqfwlIibeCz9aK4s3KjaGntW905zI5EFFbL9IPKGzXyIvP+WKjs0B0Djcxa25JaGuKOo6F64PEuRLXSGOmpUKHaPy0dvBMf4owMfwJFPR5eLknIhcADoslJDS8eSIysVHcoyV76W/HEHeZFC/y575RySHYEmOp6LxpaipONUIJwonhsPJ8/Oxiup1p9K3CTAgU6ss/bwQ7ECQjj5RTW9OpKW2lIBKc+VQIq+2KIQeFy6yFBaVy+YBvdTausST3QOE8xUWMr8+Z2W/M1OmPcIdlYU6IHWMifXqE/CzWQRMEZ4ND8AvgBzb9lQ+BHPmcGDtqnL8c4M6GF5dVbnmynbeZKlSi92kgVYCEphN3u/ELZqHT5R9eewKOadi8LEtm8ovQ3Z7wLgh3DvrcO8X9Pig1l22S4kJgahFo2vTuBV6hcog4X1qn98/ImSRVxAOo/mGq9iX4jhle2XAIqBlUjT6u+uYpSROouUC07fM+U9QtsU5mAGw1YX+IzbqphWzAxJc/FAfn46xjWwGyJIhqCzF/EuoGGvzrGic4Xq94lqZIrI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a30c589-23a4-41dd-9b6b-08d8568919b3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 19:30:11.6167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVllt1hqhxapBKisuS65DRqmnVEAyJd+EaSFa14dRKdPL8Dq2DJxvV5s9UuuLpLOtaAj0OqLWKMNdt3qp32d2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3963
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 hersenxs.wu@amd.com, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============2078824782=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2078824782==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ljmcd3qnmadcng2j"
Content-Disposition: inline

--ljmcd3qnmadcng2j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09/11, Kazlauskas, Nicholas wrote:
> On 2020-09-11 10:59 a.m., Rodrigo Siqueira wrote:
> > This commit introduces a trace mechanism for struct pipe_ctx by adding a
> > middle layer struct in the amdgpu_dm_trace.h for capturing the most
> > important data from struct pipe_ctx and showing its data via tracepoint.
> > This tracepoint was added to dc.c and dcn10_hw_sequencer, however, it
> > can be added to other DCN architecture.
> >=20
> > Co-developed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>=20
>=20
> This patch, while very useful, unfortunately pulls in a lot of DM code in=
to
> DC so I would prefer to hold off on this one for now.

Hi Nicholas, first of all, thanks for your feedback.

By "pulls in a lot of DM code into DC" do you mean all references to
plane_state and plane_res? Or the data inserted in the struct?
=20
> It would be better if this had a proper DC interface for tracing/logging
> these states. If the API was more like how we handle tracing register
> reads/writes this would be cleaner.

Could you elaborate a little bit more about  "a proper DC interface"?
What is your view of this sort of interface?

Also, how about Patch 04? Same problems?

Best Regards
Rodrigo Siqueira

> Regards,
> Nicholas Kazlauskas
>=20
> > ---
> >   .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 172 ++++++++++++++++++
> >   drivers/gpu/drm/amd/display/dc/core/dc.c      |  11 ++
> >   .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  17 +-
> >   3 files changed, 195 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> > index 5fb4c4a5c349..53f62506e17c 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> > @@ -376,6 +376,178 @@ TRACE_EVENT(amdgpu_dm_atomic_check_finish,
> >   		      __entry->async_update, __entry->allow_modeset)
> >   );
> > +#ifndef _AMDGPU_DM_TRACE_STRUCTS_DEFINED_
> > +#define _AMDGPU_DM_TRACE_STRUCTS_DEFINED_
> > +
> > +struct amdgpu_dm_trace_pipe_state {
> > +	int pipe_idx;
> > +	const void *stream;
> > +	int stream_w;
> > +	int stream_h;
> > +	int dst_x;
> > +	int dst_y;
> > +	int dst_w;
> > +	int dst_h;
> > +	int src_x;
> > +	int src_y;
> > +	int src_w;
> > +	int src_h;
> > +	int clip_x;
> > +	int clip_y;
> > +	int clip_w;
> > +	int clip_h;
> > +	int recout_x;
> > +	int recout_y;
> > +	int recout_w;
> > +	int recout_h;
> > +	int viewport_x;
> > +	int viewport_y;
> > +	int viewport_w;
> > +	int viewport_h;
> > +	int flip_immediate;
> > +	int surface_pitch;
> > +	int format;
> > +	int swizzle;
> > +	unsigned int update_flags;
> > +};
> > +
> > +#define fill_out_trace_pipe_state(trace_pipe_state, pipe_ctx) \
> > +	do { \
> > +		trace_pipe_state.pipe_idx	=3D (pipe_ctx)->pipe_idx; \
> > +		trace_pipe_state.stream		=3D (pipe_ctx)->stream; \
> > +		trace_pipe_state.stream_w	=3D (pipe_ctx)->stream->timing.h_addressab=
le; \
> > +		trace_pipe_state.stream_h	=3D (pipe_ctx)->stream->timing.v_addressab=
le; \
> > +		trace_pipe_state.dst_x		=3D (pipe_ctx)->plane_state->dst_rect.x; \
> > +		trace_pipe_state.dst_y		=3D (pipe_ctx)->plane_state->dst_rect.y; \
> > +		trace_pipe_state.dst_w		=3D (pipe_ctx)->plane_state->dst_rect.width;=
 \
> > +		trace_pipe_state.dst_h		=3D (pipe_ctx)->plane_state->dst_rect.height=
; \
> > +		trace_pipe_state.src_x		=3D (pipe_ctx)->plane_state->src_rect.x; \
> > +		trace_pipe_state.src_y		=3D (pipe_ctx)->plane_state->src_rect.y; \
> > +		trace_pipe_state.src_w		=3D (pipe_ctx)->plane_state->src_rect.width;=
 \
> > +		trace_pipe_state.src_h		=3D (pipe_ctx)->plane_state->src_rect.height=
; \
> > +		trace_pipe_state.clip_x		=3D (pipe_ctx)->plane_state->clip_rect.x; \
> > +		trace_pipe_state.clip_y		=3D (pipe_ctx)->plane_state->clip_rect.y; \
> > +		trace_pipe_state.clip_w		=3D (pipe_ctx)->plane_state->clip_rect.widt=
h; \
> > +		trace_pipe_state.clip_h		=3D (pipe_ctx)->plane_state->clip_rect.heig=
ht; \
> > +		trace_pipe_state.recout_x	=3D (pipe_ctx)->plane_res.scl_data.recout.=
x; \
> > +		trace_pipe_state.recout_y	=3D (pipe_ctx)->plane_res.scl_data.recout.=
y; \
> > +		trace_pipe_state.recout_w	=3D (pipe_ctx)->plane_res.scl_data.recout.=
width; \
> > +		trace_pipe_state.recout_h	=3D (pipe_ctx)->plane_res.scl_data.recout.=
height; \
> > +		trace_pipe_state.viewport_x	=3D (pipe_ctx)->plane_res.scl_data.viewp=
ort.x; \
> > +		trace_pipe_state.viewport_y	=3D (pipe_ctx)->plane_res.scl_data.viewp=
ort.y; \
> > +		trace_pipe_state.viewport_w	=3D (pipe_ctx)->plane_res.scl_data.viewp=
ort.width; \
> > +		trace_pipe_state.viewport_h	=3D (pipe_ctx)->plane_res.scl_data.viewp=
ort.height; \
> > +		trace_pipe_state.flip_immediate =3D (pipe_ctx)->plane_state->flip_im=
mediate; \
> > +		trace_pipe_state.surface_pitch	=3D (pipe_ctx)->plane_state->plane_si=
ze.surface_pitch; \
> > +		trace_pipe_state.format		=3D (pipe_ctx)->plane_state->format; \
> > +		trace_pipe_state.swizzle	=3D (pipe_ctx)->plane_state->tiling_info.gf=
x9.swizzle; \
> > +		trace_pipe_state.update_flags	=3D (pipe_ctx)->update_flags.raw; \
> > +	} while (0)
> > +
> > +#endif /* _AMDGPU_DM_TRACE_STRUCTS_DEFINED_ */
> > +
> > +TRACE_EVENT(amdgpu_dm_dc_pipe_state,
> > +	    TP_PROTO(const struct amdgpu_dm_trace_pipe_state *pipe_state),
> > +	    TP_ARGS(pipe_state),
> > +	    TP_STRUCT__entry(
> > +			     __field(int, pipe_idx)
> > +			     __field(const void *, stream)
> > +			     __field(int, stream_w)
> > +			     __field(int, stream_h)
> > +			     __field(int, dst_x)
> > +			     __field(int, dst_y)
> > +			     __field(int, dst_w)
> > +			     __field(int, dst_h)
> > +			     __field(int, src_x)
> > +			     __field(int, src_y)
> > +			     __field(int, src_w)
> > +			     __field(int, src_h)
> > +			     __field(int, clip_x)
> > +			     __field(int, clip_y)
> > +			     __field(int, clip_w)
> > +			     __field(int, clip_h)
> > +			     __field(int, recout_x)
> > +			     __field(int, recout_y)
> > +			     __field(int, recout_w)
> > +			     __field(int, recout_h)
> > +			     __field(int, viewport_x)
> > +			     __field(int, viewport_y)
> > +			     __field(int, viewport_w)
> > +			     __field(int, viewport_h)
> > +			     __field(int, flip_immediate)
> > +			     __field(int, surface_pitch)
> > +			     __field(int, format)
> > +			     __field(int, swizzle)
> > +			     __field(unsigned int, update_flags)
> > +	),
> > +
> > +	TP_fast_assign(
> > +		       __entry->pipe_idx =3D pipe_state->pipe_idx;
> > +		       __entry->stream =3D pipe_state->stream;
> > +		       __entry->stream_w =3D pipe_state->stream_w;
> > +		       __entry->stream_h =3D pipe_state->stream_h;
> > +		       __entry->dst_x =3D pipe_state->dst_x;
> > +		       __entry->dst_y =3D pipe_state->dst_y;
> > +		       __entry->dst_w =3D pipe_state->dst_w;
> > +		       __entry->dst_h =3D pipe_state->dst_h;
> > +		       __entry->src_x =3D pipe_state->src_x;
> > +		       __entry->src_y =3D pipe_state->src_y;
> > +		       __entry->src_w =3D pipe_state->src_w;
> > +		       __entry->src_h =3D pipe_state->src_h;
> > +		       __entry->clip_x =3D pipe_state->clip_x;
> > +		       __entry->clip_y =3D pipe_state->clip_y;
> > +		       __entry->clip_w =3D pipe_state->clip_w;
> > +		       __entry->clip_h =3D pipe_state->clip_h;
> > +		       __entry->recout_x =3D pipe_state->recout_x;
> > +		       __entry->recout_y =3D pipe_state->recout_y;
> > +		       __entry->recout_w =3D pipe_state->recout_w;
> > +		       __entry->recout_h =3D pipe_state->recout_h;
> > +		       __entry->viewport_x =3D pipe_state->viewport_x;
> > +		       __entry->viewport_y =3D pipe_state->viewport_y;
> > +		       __entry->viewport_w =3D pipe_state->viewport_w;
> > +		       __entry->viewport_h =3D pipe_state->viewport_h;
> > +		       __entry->flip_immediate =3D pipe_state->flip_immediate;
> > +		       __entry->surface_pitch =3D pipe_state->surface_pitch;
> > +		       __entry->format =3D pipe_state->format;
> > +		       __entry->swizzle =3D pipe_state->swizzle;
> > +		       __entry->update_flags =3D pipe_state->update_flags;
> > +	),
> > +	TP_printk("pipe_idx=3D%d stream=3D%p rct(%d,%d) dst=3D(%d,%d,%d,%d) "
> > +		  "src=3D(%d,%d,%d,%d) clip=3D(%d,%d,%d,%d) recout=3D(%d,%d,%d,%d) "
> > +		  "viewport=3D(%d,%d,%d,%d) flip_immediate=3D%d pitch=3D%d "
> > +		  "format=3D%d swizzle=3D%d update_flags=3D%x",
> > +		  __entry->pipe_idx,
> > +		  __entry->stream,
> > +		  __entry->stream_w,
> > +		  __entry->stream_h,
> > +		  __entry->dst_x,
> > +		  __entry->dst_y,
> > +		  __entry->dst_w,
> > +		  __entry->dst_h,
> > +		  __entry->src_x,
> > +		  __entry->src_y,
> > +		  __entry->src_w,
> > +		  __entry->src_h,
> > +		  __entry->clip_x,
> > +		  __entry->clip_y,
> > +		  __entry->clip_w,
> > +		  __entry->clip_h,
> > +		  __entry->recout_x,
> > +		  __entry->recout_y,
> > +		  __entry->recout_w,
> > +		  __entry->recout_h,
> > +		  __entry->viewport_x,
> > +		  __entry->viewport_y,
> > +		  __entry->viewport_w,
> > +		  __entry->viewport_h,
> > +		  __entry->flip_immediate,
> > +		  __entry->surface_pitch,
> > +		  __entry->format,
> > +		  __entry->swizzle,
> > +		  __entry->update_flags
> > +	)
> > +);
> > +
> >   #endif /* _AMDGPU_DM_TRACE_H_ */
> >   #undef TRACE_INCLUDE_PATH
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm=
/amd/display/dc/core/dc.c
> > index dc463d99ef50..0c9f177e5827 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> > @@ -2644,6 +2644,17 @@ void dc_commit_updates_for_stream(struct dc *dc,
> >   		}
> >   	}
> > +	for (i =3D 0; i < MAX_PIPES; ++i) {
> > +		struct pipe_ctx *pipe_ctx =3D &dc->current_state->res_ctx.pipe_ctx[i=
];
> > +
> > +		if (pipe_ctx->plane_state) {
> > +			struct amdgpu_dm_trace_pipe_state pipe_state_trace;
> > +
> > +			fill_out_trace_pipe_state(pipe_state_trace, pipe_ctx);
> > +			trace_amdgpu_dm_dc_pipe_state(&pipe_state_trace);
> > +		}
> > +	}
> > +
> >   	commit_planes_for_stream(
> >   				dc,
> >   				srf_updates,
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c =
b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> > index 8ca94f506195..464d0ad093b9 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> > @@ -1020,15 +1020,22 @@ static bool dcn10_hw_wa_force_recovery(struct d=
c *dc)
> >   }
> > -
> >   void dcn10_verify_allow_pstate_change_high(struct dc *dc)
> >   {
> > -	static bool should_log_hw_state; /* prevent hw state log by default */
> > -
> >   	if (!hubbub1_verify_allow_pstate_change_high(dc->res_pool->hubbub)) {
> > -		if (should_log_hw_state) {
> > -			dcn10_log_hw_state(dc, NULL);
> > +		int i;
> > +
> > +		for (i =3D 0; i < MAX_PIPES; ++i) {
> > +			struct pipe_ctx *pipe_ctx =3D &dc->current_state->res_ctx.pipe_ctx[=
i];
> > +
> > +			if (pipe_ctx->plane_state) {
> > +				struct amdgpu_dm_trace_pipe_state pipe_state_trace;
> > +
> > +				fill_out_trace_pipe_state(pipe_state_trace, pipe_ctx);
> > +				trace_amdgpu_dm_dc_pipe_state(&pipe_state_trace);
> > +			}
> >   		}
> > +
> >   		BREAK_TO_DEBUGGER();
> >   		if (dcn10_hw_wa_force_recovery(dc)) {
> >   		/*check again*/
> >=20
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--ljmcd3qnmadcng2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl9b0DEACgkQWJzP/com
vP/1kxAAidtH249OOgXdZyk8pMjDBEzuhpsbLJOL4wuaUABs471+DDQtFSk1szFj
YLWNUIdTtWEcd9iZD4HoYeSIJJF9h1NkwQs4Hf79wtYH5+tT9OpeBe3NQpg3wX4j
YwHtFkpif9hypAi+7qxgpdaaLmK4Yj8r5A82TmC47lq2rFnSYxgScNbiA1FVIfVc
AGdOUqQberk351xv6yf2kTelM/rC5DAUHmVVrp22rbAfmKYg7Ph2SOgJ752iRBhO
OUV1HhAjGudaOJJSi+KoWlXN6Jb30DocuQBUNJGXwHhN/46R2/UXPYiFCFvLU3yv
pDpqRp83hp0wrXwOjeWDrzWe71Jui2T9NKPmekTt3Hn54YEf83ao3HQ1RLRODSri
6nhCaV+wycNgrPICRdO/b2YWdtAdUXPzM1Zat6cuVK2AVaeZoAs0hxQfx9LBMwnS
H3KjTUNTTnJv1egMLZ9YEWhk5EUvvfwK+cWoCoJImbuk1r6IX3NotDP7wWC2sxzN
wpf6uEtdoZF0yb++40hE4R5z9laUbaqu0lwWbnRJp3txn158N8MIaSjxhEDVFSin
KkXb0zprq+Iv5vIt/xXXJVGVFTRW+K02TFfhsyt745bHPMVqngduKvXq8XhSMb3x
lUQS1rarJapCw8YvTa8+9KTq2Os0AUg8O7lpZC1XqbqRh4Vb/H4=
=3y15
-----END PGP SIGNATURE-----

--ljmcd3qnmadcng2j--

--===============2078824782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2078824782==--
