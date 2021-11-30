Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E209A463D36
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 18:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A0A6E030;
	Tue, 30 Nov 2021 17:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530246E094
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 17:49:51 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3V9B6glRz9vYVZ
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 17:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mmjwNnRleS8G for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 11:49:50 -0600 (CST)
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3V9B4WV7z9vYVy
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 11:49:50 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3V9B4WV7z9vYVy
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3V9B4WV7z9vYVy
Received: by mail-yb1-f198.google.com with SMTP id
 e131-20020a25d389000000b005fb5e6eb757so30526666ybf.22
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 09:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jq0SPU27rxNvhYJ+VkdeYOkU8ff3KWsQqbqxiwNb/cI=;
 b=QUmajKb6eJ6L/OjdV9cjhc8tHw3Nk90aKh5VXBYQ6h1niz7rqDa7qHJZEHJctOjPsr
 3kknBRBV/xSptFquEwFV4H40+2dXTvYMreQTXq7L1U3IKDk5w/1EZpRe3+IlibW1BWGc
 WgIDAEUekkfmglbKNvDcZh2j/oJravMua2Z+MpHJurOeRok7w0H8g8VtNSAS1vHh/ZbB
 deIOY+3ReaxtC/MqIEf6049NCL8vl/62Z4dNnojRqTETe6g98i1vQWCRL77acSEh8QHg
 rOanHdTGDtco26MALJJvYPWS+fX5rA9RyPTTh56580fuyBszvsEAGmxVWJVsbWGCMuHg
 5iEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jq0SPU27rxNvhYJ+VkdeYOkU8ff3KWsQqbqxiwNb/cI=;
 b=HK68HNvYUfumTroKeBng6czkSRMek9ujr1/WBWJnHVWge9dznSxgH4xUmqs4cDIxIS
 pibU4Vbvv6ci820d3lAmDbcH7Du/4yU6cTh7Zj4nGbHkPQRCbqw+MTeqUqNGHzw5M1X6
 lskcncPrVJK2hBT2GTXj05IHX4cF/gl2gzcLfETWByEi6Gmj5Qu8F+2OsdzhpQQKdjEv
 EU38n84sxBHv6gFIuvZhLOZwwiDt4gFEduXwQ7BP3oCB41Oj8Iw5kW0cx4AZAXZy3Q8t
 7Eow/6hhDXTvm2wF0BjqIBdhBNmOEGZcMfduCFETqzIHkR0waqhpMzrmSpGXjk2fpaM8
 FSug==
X-Gm-Message-State: AOAM532MAPrAnIio1VdLl0Md6DMj590AET8Fm+6ftUe+6FvqocX2g3uE
 jxfw8yd9hUTwKd3EbJo4c7MiapZhRGc3TaAJ1j2oKeEAn7zr3oJ/W4Dn9JuVdhWHlnyW2rbnSVJ
 T8tbxN/KpEEzACmMACyInB4Xf8sP3DK7iK5O4GYe4b1oKTLc4
X-Received: by 2002:a25:7ec1:: with SMTP id z184mr579892ybc.103.1638294589841; 
 Tue, 30 Nov 2021 09:49:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJww6ziF6/5ACLC/s3VkmAbk6x3koOAfyl8T7uy9xft8pktWw7kwENxVUvbHewA6/+jH/FEwJtIRy1YMyRCqt5s=
X-Received: by 2002:a25:7ec1:: with SMTP id z184mr579519ybc.103.1638294586257; 
 Tue, 30 Nov 2021 09:49:46 -0800 (PST)
MIME-Version: 1.0
References: <20211130112644.116604-1-zhou1615@umn.edu>
 <b78771ca-2ca2-a369-b67f-dc479eb87d90@amd.com>
 <4a457ba1-67df-993f-1a7a-9868a954de99@amd.com>
In-Reply-To: <4a457ba1-67df-993f-1a7a-9868a954de99@amd.com>
From: Qingyang Zhou <zhou1615@umn.edu>
Date: Wed, 1 Dec 2021 01:49:35 +0800
Message-ID: <CA+Cm_xSm8O_0M2Ng9mvDUKwYaCxkZU+M7AZ=9aU26WTFELC-2w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Fix a wild pointer dereference in
 svm_range_add()
To: Felix Kuehling <felix.kuehling@amd.com>
Content-Type: multipart/alternative; boundary="000000000000db984205d2052e25"
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, philip yang <yangp@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000db984205d2052e25
Content-Type: text/plain; charset="UTF-8"

Dear Felix:

This patch is not auto-generated, and as a matter of fact, it is requested
by the Linux Community.

As you can see from my email address, I am a researcher from the University
of Minnesota, and because of the unpleasant event that happened in April,
all the patches from our university must contain enough information for the
Linux Community to verify. Still I feel so sorry to take up your time.

yours sincerely,
zhou qingyang.


On Wed, Dec 1, 2021 at 1:35 AM Felix Kuehling <felix.kuehling@amd.com>
wrote:

> Am 2021-11-30 um 11:51 a.m. schrieb philip yang:
> >
> >
> > On 2021-11-30 6:26 a.m., Zhou Qingyang wrote:
> >> In svm_range_add(), the return value of svm_range_new() is assigned
> >> to prange and &prange->insert_list is used in list_add(). There is a
> >> a dereference of &prange->insert_list in list_add(), which could lead
> >> to a wild pointer dereference on failure of vm_range_new() if
> >> CONFIG_DEBUG_LIST is unset in .config file.
> >>
> >> Fix this bug by adding a check of prange.
> >>
> >> This bug was found by a static analyzer. The analysis employs
> >> differential checking to identify inconsistent security operations
> >> (e.g., checks or kfrees) between two code paths and confirms that the
> >> inconsistent operations are not recovered in the current function or
> >> the callers, so they constitute bugs.
> >>
> >> Note that, as a bug found by static analysis, it can be a false
> >> positive or hard to trigger. Multiple researchers have cross-reviewed
> >> the bug.
> >>
> >> Builds with CONFIG_DRM_AMDGPU=m, CONFIG_HSA_AMD=y, and
> >> CONFIG_HSA_AMD_SVM=y show no new warnings, and our static analyzer no
> >> longer warns about this code.
> >>
> >> Fixes: 42de677f7999 ("drm/amdkfd: register svm range")
> >> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> > Reviewed-by: Philip Yang <Philip.Yang@amd.com>
>
> The patch looks good to me. It's an obvious bug and definitely not a
> false positive. The patch description is a bit verbose. Is this
> auto-generated output from the static checker? It could be replaced with
> something more concise. Especially the comment about this possibly being
> a false positive should not be in the final submission.
>
> Regards,
>   Felix
>
>
> >> ---
> >>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> >> index 58b89b53ebe6..e40c2211901d 100644
> >> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> >> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> >> @@ -2940,6 +2940,9 @@ svm_range_add(struct kfd_process *p, uint64_t
> start, uint64_t size,
> >>
> >>      if (left) {
> >>              prange = svm_range_new(svms, last - left + 1, last);
> >> +            if (!prange)
> >> +                    return -ENOMEM;
> >> +
> >>              list_add(&prange->insert_list, insert_list);
> >>              list_add(&prange->update_list, update_list);
> >>      }
>

--000000000000db984205d2052e25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear=C2=A0Felix:<div><br></div><div>This patch is not auto=
-generated, and as a matter=C2=A0of fact, it is requested by the Linux Comm=
unity.</div><div><br></div><div>As you can see from my email address, I am =
a researcher from the University of Minnesota, and because of the unpleasan=
t event that happened in April, all the patches from our university must co=
ntain enough information for the Linux Community to verify. Still I feel so=
 sorry to take up your time.=C2=A0</div><div><br></div><div>yours sincerely=
,</div><div>zhou qingyang.</div><div><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 1, 2021 at 1:35 =
AM Felix Kuehling &lt;<a href=3D"mailto:felix.kuehling@amd.com" target=3D"_=
blank">felix.kuehling@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Am 2021-11-30 um 11:51 a.m. schrieb philip yan=
g:<br>
&gt;<br>
&gt;<br>
&gt; On 2021-11-30 6:26 a.m., Zhou Qingyang wrote:<br>
&gt;&gt; In svm_range_add(), the return value of svm_range_new() is assigne=
d<br>
&gt;&gt; to prange and &amp;prange-&gt;insert_list is used in list_add(). T=
here is a<br>
&gt;&gt; a dereference of &amp;prange-&gt;insert_list in list_add(), which =
could lead<br>
&gt;&gt; to a wild pointer dereference on failure of vm_range_new() if<br>
&gt;&gt; CONFIG_DEBUG_LIST is unset in .config file.<br>
&gt;&gt;<br>
&gt;&gt; Fix this bug by adding a check of prange.<br>
&gt;&gt;<br>
&gt;&gt; This bug was found by a static analyzer. The analysis employs<br>
&gt;&gt; differential checking to identify inconsistent security operations=
<br>
&gt;&gt; (e.g., checks or kfrees) between two code paths and confirms that =
the<br>
&gt;&gt; inconsistent operations are not recovered in the current function =
or<br>
&gt;&gt; the callers, so they constitute bugs.<br>
&gt;&gt;<br>
&gt;&gt; Note that, as a bug found by static analysis, it can be a false<br=
>
&gt;&gt; positive or hard to trigger. Multiple researchers have cross-revie=
wed<br>
&gt;&gt; the bug.<br>
&gt;&gt;<br>
&gt;&gt; Builds with CONFIG_DRM_AMDGPU=3Dm, CONFIG_HSA_AMD=3Dy, and<br>
&gt;&gt; CONFIG_HSA_AMD_SVM=3Dy show no new warnings, and our static analyz=
er no<br>
&gt;&gt; longer warns about this code.<br>
&gt;&gt;<br>
&gt;&gt; Fixes: 42de677f7999 (&quot;drm/amdkfd: register svm range&quot;)<b=
r>
&gt;&gt; Signed-off-by: Zhou Qingyang &lt;<a href=3D"mailto:zhou1615@umn.ed=
u" target=3D"_blank">zhou1615@umn.edu</a>&gt;<br>
&gt; Reviewed-by: Philip Yang &lt;<a href=3D"mailto:Philip.Yang@amd.com" ta=
rget=3D"_blank">Philip.Yang@amd.com</a>&gt;<br>
<br>
The patch looks good to me. It&#39;s an obvious bug and definitely not a<br=
>
false positive. The patch description is a bit verbose. Is this<br>
auto-generated output from the static checker? It could be replaced with<br=
>
something more concise. Especially the comment about this possibly being<br=
>
a false positive should not be in the final submission.<br>
<br>
Regards,<br>
=C2=A0 Felix<br>
<br>
<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 3 +++<br>
&gt;&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/dr=
m/amd/amdkfd/kfd_svm.c<br>
&gt;&gt; index 58b89b53ebe6..e40c2211901d 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c<br>
&gt;&gt; @@ -2940,6 +2940,9 @@ svm_range_add(struct kfd_process *p, uint64_=
t start, uint64_t size,<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (left) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prange =3D svm_ran=
ge_new(svms, last - left + 1, last);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!prange)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return -ENOMEM;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list_add(&amp;pran=
ge-&gt;insert_list, insert_list);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list_add(&amp;pran=
ge-&gt;update_list, update_list);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
</blockquote></div>

--000000000000db984205d2052e25--
