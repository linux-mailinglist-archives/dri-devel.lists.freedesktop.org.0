Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018026E5A5A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 09:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0AE10E6A5;
	Tue, 18 Apr 2023 07:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E748710E058;
 Tue, 18 Apr 2023 03:39:55 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id vc20so14717719ejc.10;
 Mon, 17 Apr 2023 20:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681789192; x=1684381192;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0k1bPTtZFALxZIsrYTNAdJXO+kfqhwC+sBbQizTJw+M=;
 b=lkQzwhx9fAYh4xh3EmCq7UT3c+KR1jaBKTigD2XRh7kp6wpxBgS7mWGZMhgmPIEGhB
 XyhN4KEu2Tgmex0uGtN+pbxbgjYDZEj3DoKQo4oOop0rh+6LdrkR5SjbFBmWXatiOf0z
 PCSLBddMbZrEakT3pTdE1WvxHhj4OBrxWEA+3DNRplfrWvW6sqJKIdTr2OZ4nqH47KJv
 O8pERr7DLhWWzDH9jLsNYV/fco+J+piFi6gSj0Ifovq2EEjdT8DNxwneLBbB+l8HmOfn
 r4FgY2XJIJ2A6dYCKouG8ynhLRkHrnwfHqsZfW4DcO/f3eEvv3btMLlVFQGpu49hURQR
 cUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681789192; x=1684381192;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0k1bPTtZFALxZIsrYTNAdJXO+kfqhwC+sBbQizTJw+M=;
 b=Luj7TFyVhxaHB9EBAmLPefQDL5XjM0iaj5g1nZ2A+2TsBMSOajFxjx0bMb4a4lEeZm
 dnHsZO6C3rZ9SGu7dFKepKdaNChoGuHaCAs+tikLq+1jA/29SJiD2e0csJiVz1WDsgyK
 MVWLY1FrTBqGyEf5uYQaeouDv8Dj6yjZ6NhWZHLaLxhQAs8TP9FTizVeKYbnbCZbq4xe
 9P7RMBtUelkcu8zfcgVYVwG3St3aAMXKkliwEsauQL7M6wYcL5a5Fg7haIqrpsp576EB
 CZoOkYZ0Izix4ba63LfqR2pAfCg2gHGnV7hUwLheljtwbUCxfkou84WJ6AGZS7L4l6qf
 G5Ew==
X-Gm-Message-State: AAQBX9e4e4jLLZK6SMI753EcYBCZiU3RHNQCa0GZneXzFZjoJm5cPdFI
 PXmbLLP4opJefgDglvKRpLyvmbhFqpOyLwiKSfA=
X-Google-Smtp-Source: AKy350ZGWdXznYiUyPghs6shFmobBHLZV66p34FfW1qrgfzjIU6gUmph1HJQoPElqvC2C5jgzd3TCCWDNhGX/FfjS+U=
X-Received: by 2002:a17:906:c51:b0:94e:8559:b5c5 with SMTP id
 t17-20020a1709060c5100b0094e8559b5c5mr8976394ejf.64.1681789191670; Mon, 17
 Apr 2023 20:39:51 -0700 (PDT)
MIME-Version: 1.0
From: whitehat002 whitehat002 <hackyzh002@gmail.com>
Date: Tue, 18 Apr 2023 11:39:39 +0800
Message-ID: <CAF6NKdYeQKzCami4jVaSxqC04OJNJC_ySrJkaqsmE5r=puCEdQ@mail.gmail.com>
Subject: Integer overflow leads to uninitialization vulnerability in
 amdgpu_cs_parser_init
To: Security Officers <security@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000005b50f305f9940f29"
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

--0000000000005b50f305f9940f29
Content-Type: text/plain; charset="UTF-8"

Hello,

I am going to file a security bug.

VULNERABILITY DETAILS

ioctl$AMDGPU_CS will call amdgpu_cs_ioctl which will call
amdgpu_cs_parser_init. The type of size is unsigned(4 bytes)[1]. And size
is assigned from p->chunks[i].length_dw[2] which is assigned from
user_chunk.length_dw[3], which type is __u32[4](4 bytes, under user
control). If size is 0x40000000, there will be an integer overflow, size
will be zero after size = sizeof(uint32_t)[5]. Although there is an
overflow check in kvmalloc_array[6], but it will just check size_t
overflow(8 bytes), so it will not notice this one. copy_from_user will not
copy anything, if size is zero. So p->chunks[i].kdata will be filled with
the last time used data, because kvmalloc_array[6] is called without
__GFP_ZERO flag. Finally it will access the uninitialized data[7].

```
struct drm_amdgpu_cs_chunk {
__u32 chunk_id;
__u32 length_dw; // [4]
__u64 chunk_data;
};


static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union
drm_amdgpu_cs *cs)
{
struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
struct amdgpu_vm *vm = &fpriv->vm;
uint64_t *chunk_array_user;
uint64_t *chunk_array;
unsigned size, num_ibs = 0; // [1]
uint32_t uf_offset = 0;
int i;
int ret;

if (cs->in.num_chunks == 0)
return -EINVAL;

chunk_array = kvmalloc_array(cs->in.num_chunks, sizeof(uint64_t),
GFP_KERNEL);
if (!chunk_array)
return -ENOMEM;

p->ctx = amdgpu_ctx_get(fpriv, cs->in.ctx_id);
if (!p->ctx) {
ret = -EINVAL;
goto free_chunk;
}

/* skip guilty context job */
if (atomic_read(&p->ctx->guilty) == 1) {
ret = -ECANCELED;
goto free_chunk;
}

/* get chunks */
chunk_array_user = u64_to_user_ptr(cs->in.chunks);
if (copy_from_user(chunk_array, chunk_array_user,
  sizeof(uint64_t)*cs->in.num_chunks)) {
ret = -EFAULT;
goto free_chunk;
}

p->nchunks = cs->in.num_chunks;
p->chunks = kvmalloc_array(p->nchunks, sizeof(struct amdgpu_cs_chunk),
   GFP_KERNEL);
if (!p->chunks) {
ret = -ENOMEM;
goto free_chunk;
}

for (i = 0; i < p->nchunks; i++) {
struct drm_amdgpu_cs_chunk __user **chunk_ptr = NULL;
struct drm_amdgpu_cs_chunk user_chunk;
uint32_t __user *cdata;

chunk_ptr = u64_to_user_ptr(chunk_array[i]);
if (copy_from_user(&user_chunk, chunk_ptr,
      sizeof(struct drm_amdgpu_cs_chunk))) {
ret = -EFAULT;
i--;
goto free_partial_kdata;
}
p->chunks[i].chunk_id = user_chunk.chunk_id;
p->chunks[i].length_dw = user_chunk.length_dw; // [3]

size = p->chunks[i].length_dw; // [2]
cdata = u64_to_user_ptr(user_chunk.chunk_data);

p->chunks[i].kdata = kvmalloc_array(size, sizeof(uint32_t), GFP_KERNEL); //
[6]
if (p->chunks[i].kdata == NULL) {
ret = -ENOMEM;
i--;
goto free_partial_kdata;
}
size *= sizeof(uint32_t); // [5]
if (copy_from_user(p->chunks[i].kdata, cdata, size)) {
ret = -EFAULT;
goto free_partial_kdata;
}

switch (p->chunks[i].chunk_id) {
case AMDGPU_CHUNK_ID_IB:
++num_ibs;
break;

case AMDGPU_CHUNK_ID_FENCE:
size = sizeof(struct drm_amdgpu_cs_chunk_fence);
if (p->chunks[i].length_dw * sizeof(uint32_t) < size) {
ret = -EINVAL;
goto free_partial_kdata;
}

ret = amdgpu_cs_user_fence_chunk(p, p->chunks[i].kdata, //[7]
&uf_offset);
if (ret)
goto free_partial_kdata;

break;

case AMDGPU_CHUNK_ID_BO_HANDLES:
size = sizeof(struct drm_amdgpu_bo_list_in);
if (p->chunks[i].length_dw * sizeof(uint32_t) < size) {
ret = -EINVAL;
goto free_partial_kdata;
}

ret = amdgpu_cs_bo_handles_chunk(p, p->chunks[i].kdata);
if (ret)
goto free_partial_kdata;

break;

case AMDGPU_CHUNK_ID_DEPENDENCIES:
case AMDGPU_CHUNK_ID_SYNCOBJ_IN:
case AMDGPU_CHUNK_ID_SYNCOBJ_OUT:
case AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES:
case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT:
case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL:
break;

default:
ret = -EINVAL;
goto free_partial_kdata;
}
}

ret = amdgpu_job_alloc(p->adev, num_ibs, &p->job, vm);
if (ret)
goto free_all_kdata;

if (p->ctx->vram_lost_counter != p->job->vram_lost_counter) {
ret = -ECANCELED;
goto free_all_kdata;
}

if (p->uf_entry.tv.bo)
p->job->uf_addr = uf_offset;
kvfree(chunk_array);

/* Use this opportunity to fill in task info for the vm */
amdgpu_vm_set_task_info(vm);

return 0;

free_all_kdata:
i = p->nchunks - 1;
free_partial_kdata:
for (; i >= 0; i--)
kvfree(p->chunks[i].kdata);
kvfree(p->chunks);
p->chunks = NULL;
p->nchunks = 0;
free_chunk:
kvfree(chunk_array);

return ret;
}

--0000000000005b50f305f9940f29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,=C2=A0</div><div><br></div><div>I am going to f=
ile a security bug.<br></div><div><br></div>VULNERABILITY DETAILS<br><br>io=
ctl$AMDGPU_CS will call amdgpu_cs_ioctl which will call amdgpu_cs_parser_in=
it. The type of size is unsigned(4 bytes)[1]. And size is assigned from p-&=
gt;chunks[i].length_dw[2] which is assigned from user_chunk.length_dw[3], w=
hich type is __u32[4](4 bytes, under user control). If size is 0x40000000, =
there will be an integer overflow, size will be zero after size =3D sizeof(=
uint32_t)[5]. Although there is an overflow check in kvmalloc_array[6], but=
 it will just check size_t overflow(8 bytes), so it will not notice this on=
e. copy_from_user will not copy anything, if size is zero. So p-&gt;chunks[=
i].kdata will be filled with the last time used data, because kvmalloc_arra=
y[6] is called without __GFP_ZERO flag. Finally it will access the uninitia=
lized data[7].<br><br>```<br>struct drm_amdgpu_cs_chunk {<br>	__u32		chunk_=
id;<br>	__u32		length_dw;								// [4]<br>	__u64		chunk_data;<br>};<br><br=
><br>static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union drm=
_amdgpu_cs *cs)<br>{<br>	struct amdgpu_fpriv *fpriv =3D p-&gt;filp-&gt;driv=
er_priv;<br>	struct amdgpu_vm *vm =3D &amp;fpriv-&gt;vm;<br>	uint64_t *chun=
k_array_user;<br>	uint64_t *chunk_array;<br>	unsigned size, num_ibs =3D 0;	=
						// [1]<br>	uint32_t uf_offset =3D 0;<br>	int i;<br>	int ret;<br><br>	=
if (cs-&gt;in.num_chunks =3D=3D 0)<br>		return -EINVAL;<br><br>	chunk_array=
 =3D kvmalloc_array(cs-&gt;in.num_chunks, sizeof(uint64_t), GFP_KERNEL);<br=
>	if (!chunk_array)<br>		return -ENOMEM;<br><br>	p-&gt;ctx =3D amdgpu_ctx_g=
et(fpriv, cs-&gt;in.ctx_id);<br>	if (!p-&gt;ctx) {<br>		ret =3D -EINVAL;<br=
>		goto free_chunk;<br>	}<br><br>	/* skip guilty context job */<br>	if (ato=
mic_read(&amp;p-&gt;ctx-&gt;guilty) =3D=3D 1) {<br>		ret =3D -ECANCELED;<br=
>		goto free_chunk;<br>	}<br><br>	/* get chunks */<br>	chunk_array_user =3D=
 u64_to_user_ptr(cs-&gt;in.chunks);<br>	if (copy_from_user(chunk_array, chu=
nk_array_user,<br>			 =C2=A0 sizeof(uint64_t)*cs-&gt;in.num_chunks)) {<br>	=
	ret =3D -EFAULT;<br>		goto free_chunk;<br>	}<br><br>	p-&gt;nchunks =3D cs-=
&gt;in.num_chunks;<br>	p-&gt;chunks =3D kvmalloc_array(p-&gt;nchunks, sizeo=
f(struct amdgpu_cs_chunk),<br>			 =C2=A0 =C2=A0GFP_KERNEL);<br>	if (!p-&gt;=
chunks) {<br>		ret =3D -ENOMEM;<br>		goto free_chunk;<br>	}<br><br>	for (i =
=3D 0; i &lt; p-&gt;nchunks; i++) {<br>		struct drm_amdgpu_cs_chunk __user =
**chunk_ptr =3D NULL;<br>		struct drm_amdgpu_cs_chunk user_chunk;<br>		uint=
32_t __user *cdata;<br><br>		chunk_ptr =3D u64_to_user_ptr(chunk_array[i]);=
<br>		if (copy_from_user(&amp;user_chunk, chunk_ptr,<br>				 =C2=A0 =C2=A0 =
=C2=A0 sizeof(struct drm_amdgpu_cs_chunk))) {<br>			ret =3D -EFAULT;<br>			=
i--;<br>			goto free_partial_kdata;<br>		}<br>		p-&gt;chunks[i].chunk_id =
=3D user_chunk.chunk_id;<br>		p-&gt;chunks[i].length_dw =3D user_chunk.leng=
th_dw;			// [3]<br><br>		size =3D p-&gt;chunks[i].length_dw;							// [2]<b=
r>		cdata =3D u64_to_user_ptr(user_chunk.chunk_data);<br><br>		p-&gt;chunks=
[i].kdata =3D kvmalloc_array(size, sizeof(uint32_t), GFP_KERNEL);		// [6]<b=
r>		if (p-&gt;chunks[i].kdata =3D=3D NULL) {<br>			ret =3D -ENOMEM;<br>			i=
--;<br>			goto free_partial_kdata;<br>		}<br>		size *=3D sizeof(uint32_t);	=
							// [5]<br>		if (copy_from_user(p-&gt;chunks[i].kdata, cdata, size)) =
{<br>			ret =3D -EFAULT;<br>			goto free_partial_kdata;<br>		}<br><br>		swi=
tch (p-&gt;chunks[i].chunk_id) {<br>		case AMDGPU_CHUNK_ID_IB:<br>			++num_=
ibs;<br>			break;<br><br>		case AMDGPU_CHUNK_ID_FENCE:<br>			size =3D sizeo=
f(struct drm_amdgpu_cs_chunk_fence);<br>			if (p-&gt;chunks[i].length_dw * =
sizeof(uint32_t) &lt; size) {<br>				ret =3D -EINVAL;<br>				goto free_part=
ial_kdata;<br>			}<br><br>			ret =3D amdgpu_cs_user_fence_chunk(p, p-&gt;ch=
unks[i].kdata,		//[7]<br>							 &amp;uf_offset);<br>			if (ret)<br>				got=
o free_partial_kdata;<br><br>			break;<br><br>		case AMDGPU_CHUNK_ID_BO_HAN=
DLES:<br>			size =3D sizeof(struct drm_amdgpu_bo_list_in);<br>			if (p-&gt;=
chunks[i].length_dw * sizeof(uint32_t) &lt; size) {<br>				ret =3D -EINVAL;=
<br>				goto free_partial_kdata;<br>			}<br><br>			ret =3D amdgpu_cs_bo_han=
dles_chunk(p, p-&gt;chunks[i].kdata);<br>			if (ret)<br>				goto free_parti=
al_kdata;<br><br>			break;<br><br>		case AMDGPU_CHUNK_ID_DEPENDENCIES:<br>	=
	case AMDGPU_CHUNK_ID_SYNCOBJ_IN:<br>		case AMDGPU_CHUNK_ID_SYNCOBJ_OUT:<br=
>		case AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES:<br>		case AMDGPU_CHUNK_ID_S=
YNCOBJ_TIMELINE_WAIT:<br>		case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL:<br=
>			break;<br><br>		default:<br>			ret =3D -EINVAL;<br>			goto free_partial=
_kdata;<br>		}<br>	}<br><br>	ret =3D amdgpu_job_alloc(p-&gt;adev, num_ibs, =
&amp;p-&gt;job, vm);<br>	if (ret)<br>		goto free_all_kdata;<br><br>	if (p-&=
gt;ctx-&gt;vram_lost_counter !=3D p-&gt;job-&gt;vram_lost_counter) {<br>		r=
et =3D -ECANCELED;<br>		goto free_all_kdata;<br>	}<br><br>	if (p-&gt;<a hre=
f=3D"http://uf_entry.tv.bo">uf_entry.tv.bo</a>)<br>		p-&gt;job-&gt;uf_addr =
=3D uf_offset;<br>	kvfree(chunk_array);<br><br>	/* Use this opportunity to =
fill in task info for the vm */<br>	amdgpu_vm_set_task_info(vm);<br><br>	re=
turn 0;<br><br>free_all_kdata:<br>	i =3D p-&gt;nchunks - 1;<br>free_partial=
_kdata:<br>	for (; i &gt;=3D 0; i--)<br>		kvfree(p-&gt;chunks[i].kdata);<br=
>	kvfree(p-&gt;chunks);<br>	p-&gt;chunks =3D NULL;<br>	p-&gt;nchunks =3D 0;=
<br>free_chunk:<br>	kvfree(chunk_array);<br><br>	return ret;<br>}<br></div>

--0000000000005b50f305f9940f29--
