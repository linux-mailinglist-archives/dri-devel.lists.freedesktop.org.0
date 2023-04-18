Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 888146E5A57
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 09:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB82510E692;
	Tue, 18 Apr 2023 07:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E3710E058;
 Tue, 18 Apr 2023 03:55:20 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id xi5so69697872ejb.13;
 Mon, 17 Apr 2023 20:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681790118; x=1684382118;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=36T7Hp056QeEJH2lh+GMwkGDCS5d5l14mFZqfH+91Zg=;
 b=hZZM0Z2C9de0nqIvxvT5Tz1Lmps2rWVwBsAYOaXya5i9GNyvQvx/PXMPCqP2A4TTnX
 DjVaEnFGU1UNawa83Vq7Jd+6CJ+dLB6+UEuR8MTjG7gljJtiABYIif0Fsu+dn/LaFi+U
 H/yFFbIQna8QZEuLwVDWizMYqUELm411kF9e39WAR+HsucxsprOclcjp8AwDyiPjyDRy
 IU4YVpRncILA69tQu+HQqDuxMBFbdECAiX9FX0HZC9uGmsbxHuxsSnF4+DTgZAqIa+8h
 FDmELuICHetx9yoO13o8jI4TSCHcDq6nbag7yCcX+kI6eDkGlsURvep2wE9f/4tKyhLp
 VeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681790118; x=1684382118;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=36T7Hp056QeEJH2lh+GMwkGDCS5d5l14mFZqfH+91Zg=;
 b=XKn8/BUW7mdRJuyZdzcOcnFjBlwuwd3QL8mciCB+NXre3SqlcgFafsVYWxW77vx43O
 JIR89rt85FUwVopu5TKlaLXUtcF394iKhMbATD6xtJZcU9QzbnpF4gDz6kIgV9TpOT0p
 rUx/2IO8BDNcCLJSsTEU5PdbUgGuxDZOg+ZDJsF/f1anE5QwaKkiXk4A/a/wNXJnSezy
 RC0HOkC1h3fU4zLFqULppH3J1/DufhO2YWFumEyWFwTIY1KBooFYYa05oJ7EBNARG/Rp
 osOF59jhx/VqKdjz+72/693qSgD/gDQtvdnSbiU0VBAIIBpglshIL61mOIaPNhpzIXxg
 JTfA==
X-Gm-Message-State: AAQBX9dWy04ndpKFaLWKjkYgX3akhTXyNmJXPHXhi/tJ8pvweFzb7ULQ
 ixbFVk4TQFUYG1JYYMmNW3GBSnRqevYi2WPAVOo=
X-Google-Smtp-Source: AKy350bQjvT3UoFvfePnJXM3eIotKyoWsx4SEPcBqBebKnx698HDh70Z5fhOok8dlXyQ+HN6zwcjy2vlCsL9vQUZAM8=
X-Received: by 2002:a17:907:2129:b0:92b:6f92:7705 with SMTP id
 qo9-20020a170907212900b0092b6f927705mr11308197ejb.40.1681790118056; Mon, 17
 Apr 2023 20:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6NKdYeQKzCami4jVaSxqC04OJNJC_ySrJkaqsmE5r=puCEdQ@mail.gmail.com>
In-Reply-To: <CAF6NKdYeQKzCami4jVaSxqC04OJNJC_ySrJkaqsmE5r=puCEdQ@mail.gmail.com>
From: whitehat002 whitehat002 <hackyzh002@gmail.com>
Date: Tue, 18 Apr 2023 11:55:05 +0800
Message-ID: <CAF6NKdaFkH6WYMUPLPh2na47AqW1G-7m+3O3H4T7uCsSspx6MA@mail.gmail.com>
Subject: Re: Integer overflow leads to uninitialization vulnerability in
 amdgpu_cs_parser_init
To: Security Officers <security@kernel.org>
Content-Type: multipart/alternative; boundary="00000000000092d49305f994462d"
X-Mailman-Approved-At: Tue, 18 Apr 2023 07:24:20 +0000
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000092d49305f994462d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I found that the latest code function has become amdgpu_cs_pass1,
and radeon_cs_parser_init has the same problem.And i will send the patch.

whitehat002 whitehat002 <hackyzh002@gmail.com> =E4=BA=8E2023=E5=B9=B44=E6=
=9C=8818=E6=97=A5=E5=91=A8=E4=BA=8C 11:39=E5=86=99=E9=81=93=EF=BC=9A

> Hello,
>
> I am going to file a security bug.
>
> VULNERABILITY DETAILS
>
> ioctl$AMDGPU_CS will call amdgpu_cs_ioctl which will call
> amdgpu_cs_parser_init. The type of size is unsigned(4 bytes)[1]. And size
> is assigned from p->chunks[i].length_dw[2] which is assigned from
> user_chunk.length_dw[3], which type is __u32[4](4 bytes, under user
> control). If size is 0x40000000, there will be an integer overflow, size
> will be zero after size =3D sizeof(uint32_t)[5]. Although there is an
> overflow check in kvmalloc_array[6], but it will just check size_t
> overflow(8 bytes), so it will not notice this one. copy_from_user will no=
t
> copy anything, if size is zero. So p->chunks[i].kdata will be filled with
> the last time used data, because kvmalloc_array[6] is called without
> __GFP_ZERO flag. Finally it will access the uninitialized data[7].
>
> ```
> struct drm_amdgpu_cs_chunk {
> __u32 chunk_id;
> __u32 length_dw; // [4]
> __u64 chunk_data;
> };
>
>
> static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union
> drm_amdgpu_cs *cs)
> {
> struct amdgpu_fpriv *fpriv =3D p->filp->driver_priv;
> struct amdgpu_vm *vm =3D &fpriv->vm;
> uint64_t *chunk_array_user;
> uint64_t *chunk_array;
> unsigned size, num_ibs =3D 0; // [1]
> uint32_t uf_offset =3D 0;
> int i;
> int ret;
>
> if (cs->in.num_chunks =3D=3D 0)
> return -EINVAL;
>
> chunk_array =3D kvmalloc_array(cs->in.num_chunks, sizeof(uint64_t),
> GFP_KERNEL);
> if (!chunk_array)
> return -ENOMEM;
>
> p->ctx =3D amdgpu_ctx_get(fpriv, cs->in.ctx_id);
> if (!p->ctx) {
> ret =3D -EINVAL;
> goto free_chunk;
> }
>
> /* skip guilty context job */
> if (atomic_read(&p->ctx->guilty) =3D=3D 1) {
> ret =3D -ECANCELED;
> goto free_chunk;
> }
>
> /* get chunks */
> chunk_array_user =3D u64_to_user_ptr(cs->in.chunks);
> if (copy_from_user(chunk_array, chunk_array_user,
>   sizeof(uint64_t)*cs->in.num_chunks)) {
> ret =3D -EFAULT;
> goto free_chunk;
> }
>
> p->nchunks =3D cs->in.num_chunks;
> p->chunks =3D kvmalloc_array(p->nchunks, sizeof(struct amdgpu_cs_chunk),
>    GFP_KERNEL);
> if (!p->chunks) {
> ret =3D -ENOMEM;
> goto free_chunk;
> }
>
> for (i =3D 0; i < p->nchunks; i++) {
> struct drm_amdgpu_cs_chunk __user **chunk_ptr =3D NULL;
> struct drm_amdgpu_cs_chunk user_chunk;
> uint32_t __user *cdata;
>
> chunk_ptr =3D u64_to_user_ptr(chunk_array[i]);
> if (copy_from_user(&user_chunk, chunk_ptr,
>       sizeof(struct drm_amdgpu_cs_chunk))) {
> ret =3D -EFAULT;
> i--;
> goto free_partial_kdata;
> }
> p->chunks[i].chunk_id =3D user_chunk.chunk_id;
> p->chunks[i].length_dw =3D user_chunk.length_dw; // [3]
>
> size =3D p->chunks[i].length_dw; // [2]
> cdata =3D u64_to_user_ptr(user_chunk.chunk_data);
>
> p->chunks[i].kdata =3D kvmalloc_array(size, sizeof(uint32_t), GFP_KERNEL)=
;
> // [6]
> if (p->chunks[i].kdata =3D=3D NULL) {
> ret =3D -ENOMEM;
> i--;
> goto free_partial_kdata;
> }
> size *=3D sizeof(uint32_t); // [5]
> if (copy_from_user(p->chunks[i].kdata, cdata, size)) {
> ret =3D -EFAULT;
> goto free_partial_kdata;
> }
>
> switch (p->chunks[i].chunk_id) {
> case AMDGPU_CHUNK_ID_IB:
> ++num_ibs;
> break;
>
> case AMDGPU_CHUNK_ID_FENCE:
> size =3D sizeof(struct drm_amdgpu_cs_chunk_fence);
> if (p->chunks[i].length_dw * sizeof(uint32_t) < size) {
> ret =3D -EINVAL;
> goto free_partial_kdata;
> }
>
> ret =3D amdgpu_cs_user_fence_chunk(p, p->chunks[i].kdata, //[7]
> &uf_offset);
> if (ret)
> goto free_partial_kdata;
>
> break;
>
> case AMDGPU_CHUNK_ID_BO_HANDLES:
> size =3D sizeof(struct drm_amdgpu_bo_list_in);
> if (p->chunks[i].length_dw * sizeof(uint32_t) < size) {
> ret =3D -EINVAL;
> goto free_partial_kdata;
> }
>
> ret =3D amdgpu_cs_bo_handles_chunk(p, p->chunks[i].kdata);
> if (ret)
> goto free_partial_kdata;
>
> break;
>
> case AMDGPU_CHUNK_ID_DEPENDENCIES:
> case AMDGPU_CHUNK_ID_SYNCOBJ_IN:
> case AMDGPU_CHUNK_ID_SYNCOBJ_OUT:
> case AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES:
> case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT:
> case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL:
> break;
>
> default:
> ret =3D -EINVAL;
> goto free_partial_kdata;
> }
> }
>
> ret =3D amdgpu_job_alloc(p->adev, num_ibs, &p->job, vm);
> if (ret)
> goto free_all_kdata;
>
> if (p->ctx->vram_lost_counter !=3D p->job->vram_lost_counter) {
> ret =3D -ECANCELED;
> goto free_all_kdata;
> }
>
> if (p->uf_entry.tv.bo)
> p->job->uf_addr =3D uf_offset;
> kvfree(chunk_array);
>
> /* Use this opportunity to fill in task info for the vm */
> amdgpu_vm_set_task_info(vm);
>
> return 0;
>
> free_all_kdata:
> i =3D p->nchunks - 1;
> free_partial_kdata:
> for (; i >=3D 0; i--)
> kvfree(p->chunks[i].kdata);
> kvfree(p->chunks);
> p->chunks =3D NULL;
> p->nchunks =3D 0;
> free_chunk:
> kvfree(chunk_array);
>
> return ret;
> }
>

--00000000000092d49305f994462d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, I found that the latest code function has become am=
dgpu_cs_pass1, and radeon_cs_parser_init has the same problem.And=C2=A0i wi=
ll send the patch.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">whitehat002 whitehat002 &lt;<a href=3D"mailto:hackyzh002@=
gmail.com">hackyzh002@gmail.com</a>&gt; =E4=BA=8E2023=E5=B9=B44=E6=9C=8818=
=E6=97=A5=E5=91=A8=E4=BA=8C 11:39=E5=86=99=E9=81=93=EF=BC=9A<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hello,=
=C2=A0</div><div><br></div><div>I am going to file a security bug.<br></div=
><div><br></div>VULNERABILITY DETAILS<br><br>ioctl$AMDGPU_CS will call amdg=
pu_cs_ioctl which will call amdgpu_cs_parser_init. The type of size is unsi=
gned(4 bytes)[1]. And size is assigned from p-&gt;chunks[i].length_dw[2] wh=
ich is assigned from user_chunk.length_dw[3], which type is __u32[4](4 byte=
s, under user control). If size is 0x40000000, there will be an integer ove=
rflow, size will be zero after size =3D sizeof(uint32_t)[5]. Although there=
 is an overflow check in kvmalloc_array[6], but it will just check size_t o=
verflow(8 bytes), so it will not notice this one. copy_from_user will not c=
opy anything, if size is zero. So p-&gt;chunks[i].kdata will be filled with=
 the last time used data, because kvmalloc_array[6] is called without __GFP=
_ZERO flag. Finally it will access the uninitialized data[7].<br><br>```<br=
>struct drm_amdgpu_cs_chunk {<br>	__u32		chunk_id;<br>	__u32		length_dw;			=
					// [4]<br>	__u64		chunk_data;<br>};<br><br><br>static int amdgpu_cs_pa=
rser_init(struct amdgpu_cs_parser *p, union drm_amdgpu_cs *cs)<br>{<br>	str=
uct amdgpu_fpriv *fpriv =3D p-&gt;filp-&gt;driver_priv;<br>	struct amdgpu_v=
m *vm =3D &amp;fpriv-&gt;vm;<br>	uint64_t *chunk_array_user;<br>	uint64_t *=
chunk_array;<br>	unsigned size, num_ibs =3D 0;							// [1]<br>	uint32_t uf=
_offset =3D 0;<br>	int i;<br>	int ret;<br><br>	if (cs-&gt;in.num_chunks =3D=
=3D 0)<br>		return -EINVAL;<br><br>	chunk_array =3D kvmalloc_array(cs-&gt;i=
n.num_chunks, sizeof(uint64_t), GFP_KERNEL);<br>	if (!chunk_array)<br>		ret=
urn -ENOMEM;<br><br>	p-&gt;ctx =3D amdgpu_ctx_get(fpriv, cs-&gt;in.ctx_id);=
<br>	if (!p-&gt;ctx) {<br>		ret =3D -EINVAL;<br>		goto free_chunk;<br>	}<br=
><br>	/* skip guilty context job */<br>	if (atomic_read(&amp;p-&gt;ctx-&gt;=
guilty) =3D=3D 1) {<br>		ret =3D -ECANCELED;<br>		goto free_chunk;<br>	}<br=
><br>	/* get chunks */<br>	chunk_array_user =3D u64_to_user_ptr(cs-&gt;in.c=
hunks);<br>	if (copy_from_user(chunk_array, chunk_array_user,<br>			 =C2=A0=
 sizeof(uint64_t)*cs-&gt;in.num_chunks)) {<br>		ret =3D -EFAULT;<br>		goto =
free_chunk;<br>	}<br><br>	p-&gt;nchunks =3D cs-&gt;in.num_chunks;<br>	p-&gt=
;chunks =3D kvmalloc_array(p-&gt;nchunks, sizeof(struct amdgpu_cs_chunk),<b=
r>			 =C2=A0 =C2=A0GFP_KERNEL);<br>	if (!p-&gt;chunks) {<br>		ret =3D -ENOM=
EM;<br>		goto free_chunk;<br>	}<br><br>	for (i =3D 0; i &lt; p-&gt;nchunks;=
 i++) {<br>		struct drm_amdgpu_cs_chunk __user **chunk_ptr =3D NULL;<br>		s=
truct drm_amdgpu_cs_chunk user_chunk;<br>		uint32_t __user *cdata;<br><br>	=
	chunk_ptr =3D u64_to_user_ptr(chunk_array[i]);<br>		if (copy_from_user(&am=
p;user_chunk, chunk_ptr,<br>				 =C2=A0 =C2=A0 =C2=A0 sizeof(struct drm_amd=
gpu_cs_chunk))) {<br>			ret =3D -EFAULT;<br>			i--;<br>			goto free_partial=
_kdata;<br>		}<br>		p-&gt;chunks[i].chunk_id =3D user_chunk.chunk_id;<br>		=
p-&gt;chunks[i].length_dw =3D user_chunk.length_dw;			// [3]<br><br>		size =
=3D p-&gt;chunks[i].length_dw;							// [2]<br>		cdata =3D u64_to_user_ptr(=
user_chunk.chunk_data);<br><br>		p-&gt;chunks[i].kdata =3D kvmalloc_array(s=
ize, sizeof(uint32_t), GFP_KERNEL);		// [6]<br>		if (p-&gt;chunks[i].kdata =
=3D=3D NULL) {<br>			ret =3D -ENOMEM;<br>			i--;<br>			goto free_partial_kd=
ata;<br>		}<br>		size *=3D sizeof(uint32_t);								// [5]<br>		if (copy_fr=
om_user(p-&gt;chunks[i].kdata, cdata, size)) {<br>			ret =3D -EFAULT;<br>		=
	goto free_partial_kdata;<br>		}<br><br>		switch (p-&gt;chunks[i].chunk_id)=
 {<br>		case AMDGPU_CHUNK_ID_IB:<br>			++num_ibs;<br>			break;<br><br>		cas=
e AMDGPU_CHUNK_ID_FENCE:<br>			size =3D sizeof(struct drm_amdgpu_cs_chunk_f=
ence);<br>			if (p-&gt;chunks[i].length_dw * sizeof(uint32_t) &lt; size) {<=
br>				ret =3D -EINVAL;<br>				goto free_partial_kdata;<br>			}<br><br>			r=
et =3D amdgpu_cs_user_fence_chunk(p, p-&gt;chunks[i].kdata,		//[7]<br>					=
		 &amp;uf_offset);<br>			if (ret)<br>				goto free_partial_kdata;<br><br>	=
		break;<br><br>		case AMDGPU_CHUNK_ID_BO_HANDLES:<br>			size =3D sizeof(st=
ruct drm_amdgpu_bo_list_in);<br>			if (p-&gt;chunks[i].length_dw * sizeof(u=
int32_t) &lt; size) {<br>				ret =3D -EINVAL;<br>				goto free_partial_kdat=
a;<br>			}<br><br>			ret =3D amdgpu_cs_bo_handles_chunk(p, p-&gt;chunks[i].=
kdata);<br>			if (ret)<br>				goto free_partial_kdata;<br><br>			break;<br>=
<br>		case AMDGPU_CHUNK_ID_DEPENDENCIES:<br>		case AMDGPU_CHUNK_ID_SYNCOBJ_=
IN:<br>		case AMDGPU_CHUNK_ID_SYNCOBJ_OUT:<br>		case AMDGPU_CHUNK_ID_SCHEDU=
LED_DEPENDENCIES:<br>		case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT:<br>		cas=
e AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL:<br>			break;<br><br>		default:<b=
r>			ret =3D -EINVAL;<br>			goto free_partial_kdata;<br>		}<br>	}<br><br>	r=
et =3D amdgpu_job_alloc(p-&gt;adev, num_ibs, &amp;p-&gt;job, vm);<br>	if (r=
et)<br>		goto free_all_kdata;<br><br>	if (p-&gt;ctx-&gt;vram_lost_counter !=
=3D p-&gt;job-&gt;vram_lost_counter) {<br>		ret =3D -ECANCELED;<br>		goto f=
ree_all_kdata;<br>	}<br><br>	if (p-&gt;<a href=3D"http://uf_entry.tv.bo" ta=
rget=3D"_blank">uf_entry.tv.bo</a>)<br>		p-&gt;job-&gt;uf_addr =3D uf_offse=
t;<br>	kvfree(chunk_array);<br><br>	/* Use this opportunity to fill in task=
 info for the vm */<br>	amdgpu_vm_set_task_info(vm);<br><br>	return 0;<br><=
br>free_all_kdata:<br>	i =3D p-&gt;nchunks - 1;<br>free_partial_kdata:<br>	=
for (; i &gt;=3D 0; i--)<br>		kvfree(p-&gt;chunks[i].kdata);<br>	kvfree(p-&=
gt;chunks);<br>	p-&gt;chunks =3D NULL;<br>	p-&gt;nchunks =3D 0;<br>free_chu=
nk:<br>	kvfree(chunk_array);<br><br>	return ret;<br>}<br></div>
</blockquote></div>

--00000000000092d49305f994462d--
