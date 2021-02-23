Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAC03227D4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 10:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5C76E1CD;
	Tue, 23 Feb 2021 09:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB636E1CD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 09:31:27 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id s3so11724622otg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 01:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DVFCa2/tt2H+LD0hRmA62OWnetDkcRuJ237RaPObmX8=;
 b=swbR//PfErd8XhgqzDSvvUK5jzVq9I8ZOx5107KVbKYg6OqJq5hU9Y7+FdR1SBeUja
 XJmX1+I6H5AglonFmbvrr81dNBwM3QnXE4EuG7TJWhIi/6FE1+8He3sEPJbO4INmoKra
 9iOMcrz+CTsosmGPpFBUPjF+flTGoUO7NFRfH/pMaTjMhY28cNzYuNdI2H+2agFc87TG
 NNcg1BKrJzAhg+GQMv7+q2S3lhDlcToJGSD5Pj4TUA/3WGlfjh98Gwmyxaz51z2EFPhd
 TSDFq9glzNWUmQSNEfoHH4rl6gUgulaH0LvJ5akCuSta4YkpTYqMt9yAEiC7zavZGd35
 C9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DVFCa2/tt2H+LD0hRmA62OWnetDkcRuJ237RaPObmX8=;
 b=Y5rfHSuxYequ9olAPMF1y5/bLvQZhpKgXWbJj+FqNRya8BjasBn1l7Je7w2hX4eu/e
 5P0YMqCCYxbbRsy/+Q2RBJUYVn0AbUSn0khMK7x+eU+NxDtQk8z83gLC6BNEcMLMwsuV
 LGCPSAJrodzCaCxPrL86iqbFmA0Ncu659GRWafhzFSZHStyxZmu0Q9YAJGDCnFmwkCk7
 b9ufZ3dyzySZ5ZLKjSJ8BBBCczUiR25nr5twggRdDWGv+HS7KClvRGLLt2yNvTQex36b
 s/Uoh9nfy76djhnF8YM3g4PxoeKp+oMpWnuCLPKGzGE6f/JN9Lb3laLTCGwyE5dvj+Oq
 /NWw==
X-Gm-Message-State: AOAM533+0X15BXG9bH4jiZjCEJte5OemBxuB0IUUtklp4Z4AOt/G+jNR
 AmshVAt734k/BLyRVm8euOmzcNo9peGSGyTDuPs=
X-Google-Smtp-Source: ABdhPJw119jqyynvn6i6tP3tXQai/RxjO4NuMQBdVlW9Zg6eOFuI0kMlNL/nUCHjxtta9WlCiGOPHrcAz/7jkLcfzHw=
X-Received: by 2002:a9d:67cb:: with SMTP id c11mr19768599otn.290.1614072687320; 
 Tue, 23 Feb 2021 01:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20210222151231.22572-1-romain.perier@gmail.com>
 <936bcf5e-2006-7643-7804-9efa318b3e2b@linuxfoundation.org>
In-Reply-To: <936bcf5e-2006-7643-7804-9efa318b3e2b@linuxfoundation.org>
From: Romain Perier <romain.perier@gmail.com>
Date: Tue, 23 Feb 2021 10:31:15 +0100
Message-ID: <CABgxDoLZKbrzghbp09kraEsk0iLzn7B0BEQWmZcdrXwmOu_MKw@mail.gmail.com>
Subject: Re: [PATCH 00/20] Manual replacement of all strlcpy in favor of
 strscpy
To: Shuah Khan <skhan@linuxfoundation.org>
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
Cc: alsa-devel@alsa-project.org, target-devel@vger.kernel.org,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Valentina Manea <valentina.manea.m@gmail.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Jaroslav Kysela <perex@perex.cz>,
 "J. Bruce Fields" <bfields@fieldses.org>, netdev <netdev@vger.kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-watchdog@vger.kernel.org, linux-s390@vger.kernel.org,
 Benjamin Block <bblock@linux.ibm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Steven Rostedt <rostedt@goodmis.org>, linaro-mm-sig@lists.linaro.org,
 linux-m68k@lists.linux-m68k.org, dri-devel@lists.freedesktop.org,
 Jiri Pirko <jiri@nvidia.com>, cgroups@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-integrity@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
 linux-nfs@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, "David S. Miller" <davem@davemloft.net>,
 Chuck Lever <chuck.lever@oracle.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, linux-crypto@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, Tejun Heo <tj@kernel.org>,
 Steffen Maier <maier@linux.ibm.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1946149301=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1946149301==
Content-Type: multipart/alternative; boundary="0000000000002b63e105bbfd9544"

--0000000000002b63e105bbfd9544
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 22 f=C3=A9vr. 2021 =C3=A0 17:36, Shuah Khan <skhan@linuxfoundation.=
org> a
=C3=A9crit :

>
> Cool. A quick check shows me 1031 strscpy() calls with no return
> checks. All or some of these probably need to be reviewed and add
> return checks. Is this something that is in the plan to address as
> part of this work?
>
> thanks,
> -- Shuah
>

Hi,

Initially, what we planned with Kees is to firstly replace all calls with
error handling codes (like this series does),
and then replace all other simple calls (without error handling). However,
we can also start a discussion about this topic, all suggestions are
welcome.

I am not sure that it does make sense to check all returns code in all
cases (for example in arch/alpha/kernel/setup.c, there are a ton of other
examples in the kernel). But a general review (as you suggest), would make
sense.

Regards,
Romain

--0000000000002b63e105bbfd9544
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Le=C2=A0lun. 22 f=C3=A9vr. 2021 =C3=A0=C2=A017:36, Shuah Khan &lt;<a=
 href=3D"mailto:skhan@linuxfoundation.org">skhan@linuxfoundation.org</a>&gt=
; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
Cool. A quick check shows me 1031 strscpy() calls with no return<br>
checks. All or some of these probably need to be reviewed and add<br>
return checks. Is this something that is in the plan to address as<br>
part of this work?<br>
<br>
thanks,<br>
-- Shuah<br></blockquote><div><br></div><div>
<div>Hi,</div><div><br></div><div>Initially, what we planned with Kees is t=
o firstly replace all calls with error handling codes (like this series doe=
s),</div><div>and then replace all other simple calls (without error handli=
ng). However, we can also start a discussion about this topic, all suggesti=
ons are welcome.</div><div><br></div><div>I am not sure that it does make s=
ense to check all returns code in all cases (for example in arch/alpha/kern=
el/setup.c, there are a ton of other examples in the kernel). But a general=
 review (as you suggest), would make sense.<br></div><div><br></div><div>Re=
gards,</div><div>Romain<br></div>=C2=A0 <br></div></div></div>

--0000000000002b63e105bbfd9544--

--===============1946149301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1946149301==--
