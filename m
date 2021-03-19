Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E36341237
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 02:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D986E24E;
	Fri, 19 Mar 2021 01:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687126E24E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 01:40:05 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 n6-20020a4ac7060000b02901b50acc169fso1908611ooq.12
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 18:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:date:message-id:in-reply-to:references:user-agent
 :subject:mime-version;
 bh=DLmDoANIPUVXEm+3JQQuE/deJGoeuzsXsxy1FsDSgO4=;
 b=aa2uUXzUFju23vok1QOumEWVE5JWokMLcHBsD4B9+AfXY/2So4uk/3Z8SOVGaqNeqO
 jrC44MGI6IOlITvU8dkfj+NiO1Q50WCY2L7Yhhm6KfT1fAyLWWoPpFOijy0w1MD8YoQH
 TOe08sdyf459rBQ3B1NkA1upYhYGCIjM0H6eoyyIc5wngoCaxyeL71IGIomudL8T6nTt
 dLcbr8PRx2VT5OpsASKILQvihFtu6DZwLTwwMcZe4brUpwiNcY9QSm2ZThYL+V4vwhvR
 V9tvMEdkdjzceAtPYYdIJ5NLymudKEcm3cLb2MsEvIoAHCx/lslkr9iUiNdjo0C87izA
 3NBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:subject:mime-version;
 bh=DLmDoANIPUVXEm+3JQQuE/deJGoeuzsXsxy1FsDSgO4=;
 b=Cx8+vcTpc9rNlKL8LSgU2S3JBvOPhzIeKgdumqpF2ijqkKZJJETcyaBDOX3URn/34K
 k7mMChGwFfeZ9A4cQqw1PBZ35EhAJl44CZYNQbF4hLz8m/KprpxUI6XNqMcqurghIRxk
 vaDRmas25qr2FgCWG1YaNucuVjR4GT6pZbzyBGXQX4+mbG/TkL1gFou7twAceoUPKDgY
 prGqzukFiB7fN6m019naSW3OGfflM7EVsbHyYdK8v6acp7k8DPp0NxtPPCaUICholFD7
 INjyWu5TjB7PiNu4fmh82PB9LTxRJvWQtVDfBiZ5I80xOvbqcMrP754OHJbBXT1L9wAi
 UTtA==
X-Gm-Message-State: AOAM5328+nMkbEOJyS2bUb2NudPcydHQTDUXLR302681N9A88xxgbbcr
 pY8qJJG133hBeDb+kdsXLfTRIQ==
X-Google-Smtp-Source: ABdhPJxmxapdhrn3ka4uUT868+YE2j1Z0M16XkB7jTYc4ttsB0cjox9HurQjtiD8H+lRrT7NWZfV4w==
X-Received: by 2002:a4a:e643:: with SMTP id q3mr9976167oot.46.1616118004482;
 Thu, 18 Mar 2021 18:40:04 -0700 (PDT)
Received: from [100.80.231.167] ([209.107.186.135])
 by smtp.gmail.com with ESMTPSA id y10sm868146oto.18.2021.03.18.18.40.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Mar 2021 18:40:03 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>
Date: Thu, 18 Mar 2021 20:40:01 -0500
Message-ID: <1784823ad68.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <YFNSAqJ3BM41VCGR@phenom.ffwll.local>
References: <20210316045322.2020294-1-jason@jlekstrand.net>
 <20210317221940.2146688-1-jason@jlekstrand.net>
 <20210317221940.2146688-2-jason@jlekstrand.net>
 <889da927-d7a1-bcf3-1887-542798863faf@gmail.com>
 <YFNSAqJ3BM41VCGR@phenom.ffwll.local>
User-Agent: AquaMail/1.28.1-1760 (build: 102800003)
Subject: Re: [PATCH 1/3] dma-buf: add dma_fence_array_for_each (v2)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0855622812=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0855622812==
Content-Type: multipart/alternative; boundary="----------1784823b06631a728174593659"

This is a multi-part message in MIME format.
------------1784823b06631a728174593659
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On March 18, 2021 08:13:41 Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Mar 18, 2021 at 10:38:11AM +0100, Christian König wrote:
>> Am 17.03.21 um 23:19 schrieb Jason Ekstrand:
>>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>>>
>>> Add a helper to iterate over all fences in a dma_fence_array object.
>>>
>>> v2 (Jason Ekstrand)
>>> - Return NULL from dma_fence_array_first if head == NULL.  This matches
>>> the iterator behavior of dma_fence_chain_for_each in that it iterates
>>> zero times if head == NULL.
>>> - Return NULL from dma_fence_array_next if index > array->num_fences.
>>
>> Is there any reason you send this patch alone out once more?
>>
>> I don't see any changes compared to the last version.
>
> Last patch has changed. Also I think mail delivery is a bit wobbly right
> now.

Sorry. I'm still getting used to mailing lists again. Too spoiled by 
GitLab. My intention was to re-send the series because I updated the last 
one. I think it's in pretty good shape now.

--Jason


>
> -Daniel
>
>>
>> Christian.
>>
>>>
>>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>>> ---
>>> drivers/dma-buf/dma-fence-array.c | 27 +++++++++++++++++++++++++++
>>> include/linux/dma-fence-array.h   | 17 +++++++++++++++++
>>> 2 files changed, 44 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence-array.c 
>>> b/drivers/dma-buf/dma-fence-array.c
>>> index d3fbd950be944..2ac1afc697d0f 100644
>>> --- a/drivers/dma-buf/dma-fence-array.c
>>> +++ b/drivers/dma-buf/dma-fence-array.c
>>> @@ -201,3 +201,30 @@ bool dma_fence_match_context(struct dma_fence *fence, 
>>> u64 context)
>>> return true;
>>> }
>>> EXPORT_SYMBOL(dma_fence_match_context);
>>> +
>>> +struct dma_fence *dma_fence_array_first(struct dma_fence *head)
>>> +{
>>> + struct dma_fence_array *array;
>>> +
>>> + if (!head)
>>> + return NULL;
>>> +
>>> + array = to_dma_fence_array(head);
>>> + if (!array)
>>> + return head;
>>> +
>>> + return array->fences[0];
>>> +}
>>> +EXPORT_SYMBOL(dma_fence_array_first);
>>> +
>>> +struct dma_fence *dma_fence_array_next(struct dma_fence *head,
>>> +       unsigned int index)
>>> +{
>>> + struct dma_fence_array *array = to_dma_fence_array(head);
>>> +
>>> + if (!array || index >= array->num_fences)
>>> + return NULL;
>>> +
>>> + return array->fences[index];
>>> +}
>>> +EXPORT_SYMBOL(dma_fence_array_next);
>>> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
>>> index 303dd712220fd..588ac8089dd61 100644
>>> --- a/include/linux/dma-fence-array.h
>>> +++ b/include/linux/dma-fence-array.h
>>> @@ -74,6 +74,19 @@ to_dma_fence_array(struct dma_fence *fence)
>>> return container_of(fence, struct dma_fence_array, base);
>>> }
>>> +/**
>>> + * dma_fence_array_for_each - iterate over all fences in array
>>> + * @fence: current fence
>>> + * @index: index into the array
>>> + * @head: potential dma_fence_array object
>>> + *
>>> + * Test if @array is a dma_fence_array object and if yes iterate over all 
>>> fences
>>> + * in the array. If not just iterate over the fence in @array itself.
>>> + */
>>> +#define dma_fence_array_for_each(fence, index, head) \
>>> + for (index = 0, fence = dma_fence_array_first(head); fence; \
>>> +     ++(index), fence = dma_fence_array_next(head, index))
>>> +
>>> struct dma_fence_array *dma_fence_array_create(int num_fences,
>>>        struct dma_fence **fences,
>>>        u64 context, unsigned seqno,
>>> @@ -81,4 +94,8 @@ struct dma_fence_array *dma_fence_array_create(int 
>>> num_fences,
>>> bool dma_fence_match_context(struct dma_fence *fence, u64 context);
>>> +struct dma_fence *dma_fence_array_first(struct dma_fence *head);
>>> +struct dma_fence *dma_fence_array_next(struct dma_fence *head,
>>> +       unsigned int index);
>>> +
>>> #endif /* __LINUX_DMA_FENCE_ARRAY_H */
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


------------1784823b06631a728174593659
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto"><span style=3D"font-size: 12pt;">On March 18, 2021 08:13:=
41 Daniel Vetter &lt;daniel@ffwll.ch&gt; wrote:</span></div><div id=3D"aqm-=
original" style=3D"color: black;">
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">On Thu, Mar 18, 2021 at 10:38:11AM +0100, Christian K=C3=
=B6nig wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">Am 17.03.21 um 23:19 schrieb Jason Ekstrand:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #9933CC; padding-left: 0.75ex;">
<div dir=3D"auto">From: Christian K=C3=B6nig &lt;ckoenig.leichtzumerken@gma=
il.com&gt;</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Add a helper to iterate over all fences in a dma_fence_ar=
ray object.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">v2 (Jason Ekstrand)</div>
<div dir=3D"auto">- Return NULL from dma_fence_array_first if head =3D=3D N=
ULL. &nbsp;This matches</div>
<div dir=3D"auto">the iterator behavior of dma_fence_chain_for_each in that=
 it iterates</div>
<div dir=3D"auto">zero times if head =3D=3D NULL.</div>
<div dir=3D"auto">- Return NULL from dma_fence_array_next if index &gt; arr=
ay-&gt;num_fences.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Is there any reason you send this patch alone out once mo=
re?</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I don't see any changes compared to the last version.</di=
v>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Last patch has changed. Also I think mail delivery is a b=
it wobbly right</div>
<div dir=3D"auto">now.</div></blockquote></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Sorry. I'm still getting used to mailing lists again. Too=
 spoiled by GitLab. My intention was to re-send the series because I update=
d the last one. I think it's in pretty good shape now.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">--Jason</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto"><br></div><div id=3D"aqm-original" style=3D"color: black;" d=
ir=3D"auto"><blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin=
: 0 0 0 0.75ex; border-left: 1px solid #808080; padding-left: 0.75ex;"><div=
 dir=3D"auto"></div>
<div dir=3D"auto">-Daniel</div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Christian.</div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #9933CC; padding-left: 0.75ex;">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Signed-off-by: Jason Ekstrand &lt;jason@jlekstrand.net&gt=
;</div>
<div dir=3D"auto">---</div>
<div dir=3D"auto">drivers/dma-buf/dma-fence-array.c | 27 ++++++++++++++++++=
+++++++++</div>
<div dir=3D"auto">include/linux/dma-fence-array.h &nbsp; | 17 +++++++++++++=
++++</div>
<div dir=3D"auto">2 files changed, 44 insertions(+)</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/=
dma-buf/dma-fence-array.c</div>
<div dir=3D"auto">index d3fbd950be944..2ac1afc697d0f 100644</div>
<div dir=3D"auto">--- a/drivers/dma-buf/dma-fence-array.c</div>
<div dir=3D"auto">+++ b/drivers/dma-buf/dma-fence-array.c</div>
<div dir=3D"auto">@@ -201,3 +201,30 @@ bool dma_fence_match_context(struct =
dma_fence *fence, u64 context)</div>
<div dir=3D"auto">return true;</div>
<div dir=3D"auto">}</div>
<div dir=3D"auto">EXPORT_SYMBOL(dma_fence_match_context);</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+struct dma_fence *dma_fence_array_first(struct dma_fence=
 *head)</div>
<div dir=3D"auto">+{</div>
<div dir=3D"auto">+=09struct dma_fence_array *array;</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09if (!head)</div>
<div dir=3D"auto">+=09=09return NULL;</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09array =3D to_dma_fence_array(head);</div>
<div dir=3D"auto">+=09if (!array)</div>
<div dir=3D"auto">+=09=09return head;</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09return array-&gt;fences[0];</div>
<div dir=3D"auto">+}</div>
<div dir=3D"auto">+EXPORT_SYMBOL(dma_fence_array_first);</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+struct dma_fence *dma_fence_array_next(struct dma_fence =
*head,</div>
<div dir=3D"auto">+=09=09=09=09 &nbsp; &nbsp; &nbsp; unsigned int index)</d=
iv>
<div dir=3D"auto">+{</div>
<div dir=3D"auto">+=09struct dma_fence_array *array =3D to_dma_fence_array(=
head);</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09if (!array || index &gt;=3D array-&gt;num_fences)</di=
v>
<div dir=3D"auto">+=09=09return NULL;</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09return array-&gt;fences[index];</div>
<div dir=3D"auto">+}</div>
<div dir=3D"auto">+EXPORT_SYMBOL(dma_fence_array_next);</div>
<div dir=3D"auto">diff --git a/include/linux/dma-fence-array.h b/include/li=
nux/dma-fence-array.h</div>
<div dir=3D"auto">index 303dd712220fd..588ac8089dd61 100644</div>
<div dir=3D"auto">--- a/include/linux/dma-fence-array.h</div>
<div dir=3D"auto">+++ b/include/linux/dma-fence-array.h</div>
<div dir=3D"auto">@@ -74,6 +74,19 @@ to_dma_fence_array(struct dma_fence *f=
ence)</div>
<div dir=3D"auto">return container_of(fence, struct dma_fence_array, base);=
</div>
<div dir=3D"auto">}</div>
<div dir=3D"auto">+/**</div>
<div dir=3D"auto">+ * dma_fence_array_for_each - iterate over all fences in=
 array</div>
<div dir=3D"auto">+ * @fence: current fence</div>
<div dir=3D"auto">+ * @index: index into the array</div>
<div dir=3D"auto">+ * @head: potential dma_fence_array object</div>
<div dir=3D"auto">+ *</div>
<div dir=3D"auto">+ * Test if @array is a dma_fence_array object and if yes=
 iterate over all fences</div>
<div dir=3D"auto">+ * in the array. If not just iterate over the fence in @=
array itself.</div>
<div dir=3D"auto">+ */</div>
<div dir=3D"auto">+#define dma_fence_array_for_each(fence, index, head)=09=
=09=09\</div>
<div dir=3D"auto">+=09for (index =3D 0, fence =3D dma_fence_array_first(hea=
d); fence;=09\</div>
<div dir=3D"auto">+=09 &nbsp; &nbsp; ++(index), fence =3D dma_fence_array_n=
ext(head, index))</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">struct dma_fence_array *dma_fence_array_create(int num_fe=
nces,</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; struct dma_fence **fences,</d=
iv>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; u64 context, unsigned seqno,<=
/div>
<div dir=3D"auto">@@ -81,4 +94,8 @@ struct dma_fence_array *dma_fence_array=
_create(int num_fences,</div>
<div dir=3D"auto">bool dma_fence_match_context(struct dma_fence *fence, u64=
 context);</div>
<div dir=3D"auto">+struct dma_fence *dma_fence_array_first(struct dma_fence=
 *head);</div>
<div dir=3D"auto">+struct dma_fence *dma_fence_array_next(struct dma_fence =
*head,</div>
<div dir=3D"auto">+=09=09=09=09 &nbsp; &nbsp; &nbsp; unsigned int index);</=
div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">#endif /* __LINUX_DMA_FENCE_ARRAY_H */</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">_______________________________________________</div>
<div dir=3D"auto">dri-devel mailing list</div>
<div dir=3D"auto">dri-devel@lists.freedesktop.org</div>
<div dir=3D"auto">https://lists.freedesktop.org/mailman/listinfo/dri-devel<=
/div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">--&nbsp;</div>
<div dir=3D"auto">Daniel Vetter</div>
<div dir=3D"auto">Software Engineer, Intel Corporation</div>
<div dir=3D"auto">http://blog.ffwll.ch</div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

------------1784823b06631a728174593659--


--===============0855622812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0855622812==--

