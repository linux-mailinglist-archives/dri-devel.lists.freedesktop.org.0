Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 362A25B1C0B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 13:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D1310EAAD;
	Thu,  8 Sep 2022 11:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E79510E9B1;
 Thu,  8 Sep 2022 11:59:37 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id m1so23969347edb.7;
 Thu, 08 Sep 2022 04:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:from:to:cc:subject:date;
 bh=8b2MJslzI2FgqiaA31msAYR5aFdBuHD8JEwPpci0xyQ=;
 b=BLsrtxfKzGCFT8GNpAm8BP/RTYJyAVpPHZdWwdv6dy/5GNSsp4G3SsrXgtYNvi84RC
 ViwSyq2p6ILojh1dQtuwa7I7EPPWVWDs5duZ1m/e3kRY6EJ2gkxVnMx7YhBLc624Cplr
 nITrVQ7VLkHkltcsboWZV1FFRyIC8htBWq2n1gLtyQnkWQE5SWl5K25zs049DafTy+Mi
 0xYvvQkGDgAjMQiinF6C0c/HOD+FriPE4ByHhxjfq8V+AjgjNm2x1apQz5EouePmHq0g
 zy6DCzNdk5AWv7TH2uuxYQ2Pq5DSVUxnOMJLgbq3kQNjeM0Y/aVR8xCyQcxsuSZlkzEk
 KrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=8b2MJslzI2FgqiaA31msAYR5aFdBuHD8JEwPpci0xyQ=;
 b=gSzonVf2VUl2ziIlSPuNRAIOEdc/QNVwhXyyd5QjBVeGZuM0J/KxZ1hgZRuAOvQwqa
 Z2NY6C8vr2XZTKEJ4TpIZvqjr+HgNAdHWR7MvaRXX92guDGhqjZkrDAITQ7s/KinVxyi
 z+4DZnOudcw0bFxVhzavi7mSLmnP3R+ReAaLPDNjKXK8wZgZgAHpLdYxLzVGI/Vcb+rd
 mfMTH6mRmhQO5E02iGg82qE6Wh8U8kvPW+LUqiif878SgYgaxQ/eisY5RPlpad5ajfY0
 4tNtGYRNofaGnaL/XJC5342jDAkGDfz4qloRTnph6ZFdxA3AJe2dQ8LiSEyCrXEdj0XR
 Vp/A==
X-Gm-Message-State: ACgBeo2301Ebi6+ajnh99LA28snpSCBJn8jzJViG6W9yT5dkHiG1E+6C
 GUNnlMrcD2uGzcec624uSlF1K4mtc6iRcg+p1Do=
X-Google-Smtp-Source: AA6agR4AUFWWXHTseKYThuJTRCiTz7tWyNWSN1iNRIjdMRC8gLCFFo5UscrqfqBRZQjxbYKbcDhuAMxT9qDdfswELK4=
X-Received: by 2002:aa7:df87:0:b0:44e:2851:7e8d with SMTP id
 b7-20020aa7df87000000b0044e28517e8dmr6977381edy.106.1662638375444; Thu, 08
 Sep 2022 04:59:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6400:5598:0:0:0:0 with HTTP; Thu, 8 Sep 2022 04:59:34
 -0700 (PDT)
In-Reply-To: <Yxmzj2nCoTKurCY8@kroah.com>
References: <tencent_E1BBF05904DFB73C478DCD592740AAE0780A@qq.com>
 <CAJedcCxVW++iH49UFZp9ruUuTcNubWCH6Wsqe11K4COB3E8msg@mail.gmail.com>
 <CAJedcCw1eJqjSK+yR7eQMDheNtH3Mjm+viwt00xAhnmrfpq2pw@mail.gmail.com>
 <CAJedcCweHjD78F7iydiq6Xc2iH=t_3m=H9JKnaCooToUk32FvQ@mail.gmail.com>
 <YxWtfjfpNsoPUrgh@kroah.com>
 <CAJedcCzMo51aiy=Dv7zn7VmL3gwkw7JgzwAPAB2Z27C9CnhoYA@mail.gmail.com>
 <20220907030754.GU1089@zhen-hp.sh.intel.com>
 <CAJedcCxO_Rq0qMeLiHtY5+FuN1A1pDGsZd3gMtvUpm1xbAK3aA@mail.gmail.com>
 <Yxmzj2nCoTKurCY8@kroah.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Thu, 8 Sep 2022 19:59:34 +0800
Message-ID: <CAJedcCwVC6Rg+wF7h6GhFvL6BGkKV=DS9Mo9fOf-gfDAk9VqPg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry.
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000c223f205e82929de"
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
Cc: "alex000young@gmail.com" <alex000young@gmail.com>,
 "security@kernel.org" <security@kernel.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 xmzyshypnc <1002992920@qq.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000c223f205e82929de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

I got it, Greg.

Mid-Autumn Festival is coming and I will have a couple of days off.
I'll see what I can do after holiday :)

Regards,

Zheng Wang

=E5=9C=A8 2022=E5=B9=B49=E6=9C=888=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B=EF=
=BC=8CGreg KH <gregkh@linuxfoundation.org> =E5=86=99=E9=81=93=EF=BC=9A

> On Thu, Sep 08, 2022 at 05:09:40PM +0800, Zheng Hacker wrote:
> > Hi Zhenyu,
> >
> > This issue has been open for a few days. Could you plz write a patch
> > for that :) I'm not familiar with the logical code here.
>
> As this is only able to be hit in a theoretical system, it isn't that
> high of a priority, if any priority at all.  Why not try to write a
> patch for it yourself to help resolve the issue faster?
>
> thanks,
>
> greg k-h
>

--000000000000c223f205e82929de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,<br><br>I got it, Greg.<br><br>Mid-Autumn Festival is coming and I =
will have a couple of days off.<br>I&#39;ll see what I can do after holiday=
 :)<br><br>Regards,<br><br>Zheng Wang<br><br>=E5=9C=A8 2022=E5=B9=B49=E6=9C=
=888=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B=EF=BC=8CGreg KH &lt;<a href=3D"mai=
lto:gregkh@linuxfoundation.org">gregkh@linuxfoundation.org</a>&gt; =E5=86=
=99=E9=81=93=EF=BC=9A<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Sep 08, 202=
2 at 05:09:40PM +0800, Zheng Hacker wrote:<br>
&gt; Hi Zhenyu,<br>
&gt; <br>
&gt; This issue has been open for a few days. Could you plz write a patch<b=
r>
&gt; for that :) I&#39;m not familiar with the logical code here.<br>
<br>
As this is only able to be hit in a theoretical system, it isn&#39;t that<b=
r>
high of a priority, if any priority at all.=C2=A0 Why not try to write a<br=
>
patch for it yourself to help resolve the issue faster?<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote>

--000000000000c223f205e82929de--
