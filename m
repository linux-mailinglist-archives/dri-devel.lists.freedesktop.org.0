Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C57B162FB1C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 18:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F7A10E79A;
	Fri, 18 Nov 2022 17:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C3E10E79A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 17:05:28 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-368edbc2c18so54967977b3.13
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 09:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pYaO4frsra4fw6h53DPHPnYJpAOilXGJ6vC54BFE2Kk=;
 b=djHYj3FUbzZdZg37yc4Igv/IRvLcb6mqU5V2Uwm6tOtJRNs0J7H3gpvKqCX9RvzED1
 0P5LettHbtzsmOpfd1GLqt/g/EXkicFlh/9XKQBWMs/MEGMuBHXk692DkY3ncnY8MBvg
 XUeD+PzQJ4C+BHG4NYnjEv68I63G9IZ8nt7jwpfsT9lepT5VnCNct98/rOBBIYSpxZGE
 0W9fU3BfnBtnkjtpj4RAGBLCVUEJ/8NY7ACvvn4d3ydHWzfe9OY9gC/VomcYjI+H8OjC
 4fQM2c2sHqTkWXRA2YZPpebcyCeI5zt5JcGmGga3n1NeduoRPQYW/4pj0CoNNtOIwWh3
 vr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pYaO4frsra4fw6h53DPHPnYJpAOilXGJ6vC54BFE2Kk=;
 b=SwVarFL3BWPlqmoioV47lTQhHYrgEmoMNIaqtZ1GikfZ/eBqo14gOmH3FuLhWNNafa
 JrUctXV1HGNTI7gHFOcPzCwfmWyf32aSxKP+U05nU6L3wcM+AL7gU84R8JKIrBKs3K9n
 nABaJuK+ViFxMnlgGkyRZoEEtdYP98bFz7/bA+q/A1jVa4wimBgyqBdLvjvreCzNpFf4
 S0E1PUkgI7l3lzDA334Zl9FtrB8J3aern4wEkmDP+MzQwYcqLHCrC+vNs3CmwgYWp7kx
 zhzbHo2LFciJp3nuaNHdhnDC7++B7m2AIOddAH/nLLRVGPo4Gz4yagJx8fYMtNt6CKAb
 Uyyw==
X-Gm-Message-State: ANoB5pkSWySU9YtSUIWCzVRrZwJaUYHJZFPs7uGPHhmfTts5GUytnb+Y
 4ex3O+PYZTEhPWADqiwgk0PpTs4R3NdedP23+PX9KA==
X-Google-Smtp-Source: AA0mqf6kYHjsb6cu7KeYD/Mn97m8h6gicsJm1ZP/wL2CBHiJ8/o9DeqQtFcPT83VCJF0cJ84uNPXpCEtXkqxuPA27Xg=
X-Received: by 2002:a0d:d684:0:b0:36d:2169:3d65 with SMTP id
 y126-20020a0dd684000000b0036d21693d65mr7131722ywd.317.1668791126861; Fri, 18
 Nov 2022 09:05:26 -0800 (PST)
MIME-Version: 1.0
References: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
 <f12a5dbe-4626-f6c7-236b-30bb16be1dd6@quicinc.com>
 <99d3aee6-ba3e-5333-6f79-ddbcfc0e8843@amd.com>
 <CABdmKX1UMB0L0PmHB59nijReZef6LUQ3XKXitHZo2YnUrJTz9Q@mail.gmail.com>
 <2c9fa595-e788-5474-4f2b-ffbd08a70d13@amd.com>
In-Reply-To: <2c9fa595-e788-5474-4f2b-ffbd08a70d13@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 18 Nov 2022 09:05:12 -0800
Message-ID: <CABdmKX0KJJV0iQwy0aUNXcLc1DGyLjmh6_Y53asHEoh-uyHzAA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Fix possible UAF in dma_buf_export
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="00000000000052805605edc1b6f9"
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
Cc: Pavan Kondeti <quic_pkondeti@quicinc.com>, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 Charan Teja Kalla <quic_charante@quicinc.com>,
 Gaosheng Cui <cuigaosheng1@huawei.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000052805605edc1b6f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 12:27 AM Christian K=C3=B6nig <christian.koenig@amd=
.com>
wrote:

> Am 18.11.22 um 03:36 schrieb T.J. Mercier:
> > On Thu, Nov 17, 2022 at 2:16 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 17.11.22 um 08:48 schrieb Charan Teja Kalla:
> >>> Sometime back Dan also reported the same issue[1] where I do mentione=
d
> >>> that fput()-->dma_buf_file_release() will remove it from the list.
> >>>
> >>> But it seems that I failed to notice fput() here calls the
> >>> dma_buf_file_release() asynchronously i.e. dmabuf that is accessed in
> >>> the close path is already freed. Am I wrong here?
> >>>
> >>> Should we have the __fput_sync(file) here instead of just fput(file)
> >>> which can solve this problem?
> >>>
> >>> [1]
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
kernel.org%2Fall%2F20220516084704.GG29930%40kadam%2F&amp;data=3D05%7C01%7Cc=
hristian.koenig%40amd.com%7C7d87a302d300479ecfa608dac90dc9f4%7C3dd8961fe488=
4e608e11a82d994e183d%7C0%7C0%7C638043358319479671%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C=
%7C%7C&amp;sdata=3DerPl1hGdfLbfCxK3J3xiIR9boJbgj6hPUnCBvZFobog%3D&amp;reser=
ved=3D0
> >> That doesn't look like the right solution to me either.
> >>
> >> Essentially we have two separate tear down methods for the dma_buf
> >> object here:
> >>
> >> 1. It's not completely initialized and we can call kfree()+module_put(=
)
> >> to clean up.
> >>       There is actually a dma_resv_fini() here. That should probably b=
e
> >> fixed.
> >>
> >> 2. The dma_buf object is fully initialized, but creating the sysfs sta=
ts
> >> file failed.
> >>       In this case we should *not* clean it up like we currently do, b=
ut
> >> rather call fput().
> >>
> >> So the right thing to do is a) fix the missing dma_resv_fini() call an=
d
> >> b) drop the setting d_fsdata=3DNULL hack and properly return after the
> fput().
> >>
> > This looks right to me if by properly return you mean return
> > ERR_PTR(ret); at the end of err_sysfs after the fput. (letting
> > dma_buf_file_release and dma_buf_release do the full cleanup)
>
> Yes, exactly that's the idea.
>
> The only alternatives I can see would be to either move allocating the
> file and so completing the dma_buf initialization last again or just
> ignore errors from sysfs.
>
> > If we still want to avoid calling dmabuf->ops->release(dmabuf) in
> > dma_buf_release like the comment says I guess we could use sysfs_entry
> > and ERR_PTR to flag that, otherwise it looks like we'd need a bit
> > somewhere.
>
> No, this should be dropped as far as I can see. The sysfs cleanup code
> looks like it can handle not initialized kobj pointers.
>

Yeah there is also the null check in dma_buf_stats_teardown() that would
prevent it from running, but I understood the comment to be referring to
the release() dma_buf_ops call into the exporter which comes right after
the teardown call. That looks like it's preventing the fput task work
calling back into the exporter after the exporter already got an error from
dma_buf_export(). Otherwise the exporter sees a release() for a buffer that
it doesn't know about / thinks shouldn't exist. So I could imagine an
exporter trying to double free: once for the failed dma_buf_export() call,
and again when the release() op is called later.

>
> Regards,
> Christian.
>
> >
> >   >
> >> Regards,
> >> Christian.
> >>
> >>> Thanks,
> >>> Charan
> >>> On 11/17/2022 11:51 AM, Gaosheng Cui wrote:
> >>>> Smatch report warning as follows:
> >>>>
> >>>> drivers/dma-buf/dma-buf.c:681 dma_buf_export() warn:
> >>>>     '&dmabuf->list_node' not removed from list
> >>>>
> >>>> If dma_buf_stats_setup() fails in dma_buf_export(), goto err_sysfs
> >>>> and dmabuf will be freed, but dmabuf->list_node will not be removed
> >>>> from db_list.head, then list traversal may cause UAF.
> >>>>
> >>>> Fix by removeing it from db_list.head before free().
> >>>>
> >>>> Fixes: ef3a6b70507a ("dma-buf: call dma_buf_stats_setup after dmabuf
> is in valid list")
> >>>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> >>>> ---
> >>>>    drivers/dma-buf/dma-buf.c | 3 +++
> >>>>    1 file changed, 3 insertions(+)
> >>>>
> >>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >>>> index b809513b03fe..6848f50226d5 100644
> >>>> --- a/drivers/dma-buf/dma-buf.c
> >>>> +++ b/drivers/dma-buf/dma-buf.c
> >>>> @@ -675,6 +675,9 @@ struct dma_buf *dma_buf_export(const struct
> dma_buf_export_info *exp_info)
> >>>>       return dmabuf;
> >>>>
> >>>>    err_sysfs:
> >>>> +    mutex_lock(&db_list.lock);
> >>>> +    list_del(&dmabuf->list_node);
> >>>> +    mutex_unlock(&db_list.lock);
> >>>>       /*
> >>>>        * Set file->f_path.dentry->d_fsdata to NULL so that when
> >>>>        * dma_buf_release() gets invoked by dentry_ops, it exits
>
>

--00000000000052805605edc1b6f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 18, 2022=
 at 12:27 AM Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@am=
d.com">christian.koenig@amd.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Am 18.11.22 um 03:36 schrieb T.J. Mercier:=
<br>
&gt; On Thu, Nov 17, 2022 at 2:16 AM Christian K=C3=B6nig<br>
&gt; &lt;<a href=3D"mailto:christian.koenig@amd.com" target=3D"_blank">chri=
stian.koenig@amd.com</a>&gt; wrote:<br>
&gt;&gt; Am 17.11.22 um 08:48 schrieb Charan Teja Kalla:<br>
&gt;&gt;&gt; Sometime back Dan also reported the same issue[1] where I do m=
entioned<br>
&gt;&gt;&gt; that fput()--&gt;dma_buf_file_release() will remove it from th=
e list.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; But it seems that I failed to notice fput() here calls the<br>
&gt;&gt;&gt; dma_buf_file_release() asynchronously i.e. dmabuf that is acce=
ssed in<br>
&gt;&gt;&gt; the close path is already freed. Am I wrong here?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Should we have the __fput_sync(file) here instead of just fput=
(file)<br>
&gt;&gt;&gt; which can solve this problem?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [1]<a href=3D"https://nam11.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Flore.kernel.org%2Fall%2F20220516084704.GG29930%40kadam%=
2F&amp;amp;data=3D05%7C01%7Cchristian.koenig%40amd.com%7C7d87a302d300479ecf=
a608dac90dc9f4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638043358319479=
671%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DerPl1hGdfLbfCxK3J3xiIR9=
boJbgj6hPUnCBvZFobog%3D&amp;amp;reserved=3D0" rel=3D"noreferrer" target=3D"=
_blank">https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flore.kernel.org%2Fall%2F20220516084704.GG29930%40kadam%2F&amp;amp;data=3D0=
5%7C01%7Cchristian.koenig%40amd.com%7C7d87a302d300479ecfa608dac90dc9f4%7C3d=
d8961fe4884e608e11a82d994e183d%7C0%7C0%7C638043358319479671%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000%7C%7C%7C&amp;amp;sdata=3DerPl1hGdfLbfCxK3J3xiIR9boJbgj6hPUnCBvZFobo=
g%3D&amp;amp;reserved=3D0</a><br>
&gt;&gt; That doesn&#39;t look like the right solution to me either.<br>
&gt;&gt;<br>
&gt;&gt; Essentially we have two separate tear down methods for the dma_buf=
<br>
&gt;&gt; object here:<br>
&gt;&gt;<br>
&gt;&gt; 1. It&#39;s not completely initialized and we can call kfree()+mod=
ule_put()<br>
&gt;&gt; to clean up.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0There is actually a dma_resv_fini() here=
. That should probably be<br>
&gt;&gt; fixed.<br>
&gt;&gt;<br>
&gt;&gt; 2. The dma_buf object is fully initialized, but creating the sysfs=
 stats<br>
&gt;&gt; file failed.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0In this case we should *not* clean it up=
 like we currently do, but<br>
&gt;&gt; rather call fput().<br>
&gt;&gt;<br>
&gt;&gt; So the right thing to do is a) fix the missing dma_resv_fini() cal=
l and<br>
&gt;&gt; b) drop the setting d_fsdata=3DNULL hack and properly return after=
 the fput().<br>
&gt;&gt;<br>
&gt; This looks right to me if by properly return you mean return<br>
&gt; ERR_PTR(ret); at the end of err_sysfs after the fput. (letting<br>
&gt; dma_buf_file_release and dma_buf_release do the full cleanup)<br>
<br>
Yes, exactly that&#39;s the idea.<br>
<br>
The only alternatives I can see would be to either move allocating the <br>
file and so completing the dma_buf initialization last again or just <br>
ignore errors from sysfs.<br>
<br>
&gt; If we still want to avoid calling dmabuf-&gt;ops-&gt;release(dmabuf) i=
n<br>
&gt; dma_buf_release like the comment says I guess we could use sysfs_entry=
<br>
&gt; and ERR_PTR to flag that, otherwise it looks like we&#39;d need a bit<=
br>
&gt; somewhere.<br>
<br>
No, this should be dropped as far as I can see. The sysfs cleanup code <br>
looks like it can handle not initialized kobj pointers.<br></blockquote><di=
v><br></div><div class=3D"gmail_default" style=3D"font-family:arial,sans-se=
rif;font-size:small">Yeah there is also the null check in dma_buf_stats_tea=
rdown() that would prevent it from running, but I understood the comment to=
 be referring to the release() dma_buf_ops call into the exporter which com=
es right after the teardown call. That looks like it&#39;s preventing the f=
put task work calling back into the exporter after the exporter already got=
 an error from dma_buf_export(). Otherwise the exporter sees a release() fo=
r a buffer that it doesn&#39;t know about / thinks shouldn&#39;t exist. So =
I could imagine an exporter trying to double free: once for the failed dma_=
buf_export() call, and again when the release() op is called later.=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
Christian.<br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Christian.<br>
&gt;&gt;<br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt; Charan<br>
&gt;&gt;&gt; On 11/17/2022 11:51 AM, Gaosheng Cui wrote:<br>
&gt;&gt;&gt;&gt; Smatch report warning as follows:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; drivers/dma-buf/dma-buf.c:681 dma_buf_export() warn:<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&#39;&amp;dmabuf-&gt;list_node&#39; not=
 removed from list<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; If dma_buf_stats_setup() fails in dma_buf_export(), goto e=
rr_sysfs<br>
&gt;&gt;&gt;&gt; and dmabuf will be freed, but dmabuf-&gt;list_node will no=
t be removed<br>
&gt;&gt;&gt;&gt; from db_list.head, then list traversal may cause UAF.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Fix by removeing it from db_list.head before free().<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Fixes: ef3a6b70507a (&quot;dma-buf: call dma_buf_stats_set=
up after dmabuf is in valid list&quot;)<br>
&gt;&gt;&gt;&gt; Signed-off-by: Gaosheng Cui &lt;<a href=3D"mailto:cuigaosh=
eng1@huawei.com" target=3D"_blank">cuigaosheng1@huawei.com</a>&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 drivers/dma-buf/dma-buf.c | 3 +++<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 3 insertions(+)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/d=
ma-buf.c<br>
&gt;&gt;&gt;&gt; index b809513b03fe..6848f50226d5 100644<br>
&gt;&gt;&gt;&gt; --- a/drivers/dma-buf/dma-buf.c<br>
&gt;&gt;&gt;&gt; +++ b/drivers/dma-buf/dma-buf.c<br>
&gt;&gt;&gt;&gt; @@ -675,6 +675,9 @@ struct dma_buf *dma_buf_export(const s=
truct dma_buf_export_info *exp_info)<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return dmabuf;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 err_sysfs:<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 mutex_lock(&amp;db_list.lock);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 list_del(&amp;dmabuf-&gt;list_node);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 mutex_unlock(&amp;db_list.lock);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Set file-&gt;f_path.dentry-&g=
t;d_fsdata to NULL so that when<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * dma_buf_release() gets invoke=
d by dentry_ops, it exits<br>
<br>
</blockquote></div></div>

--00000000000052805605edc1b6f9--
