Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE071F1061
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 08:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29276EC21;
	Wed,  6 Nov 2019 07:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74936EB75;
 Tue,  5 Nov 2019 22:21:09 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id e2so22772487qkn.5;
 Tue, 05 Nov 2019 14:21:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aus42zVQdD/RHTyJA1fIBvJ1pjPROj7oAL3RvLlSe8Y=;
 b=Hm629NOJmvc2vdp0zjRv9HTzXRWj/S5M3t0AGVG6TcdOcy5lW8duNkYJzOfBt8zxV9
 qmu02ewzQ859lxha5w3S3sjYbhd29ZA5vJdSqdpdiE5r2kVZES45WEnhN08tQRYacjLS
 RDnjmjo/qih9jnySJ0RqgprNe3OtYwoUdtnIA9IlrBjVebGKxVYT0I1bV+spPmwuA0vZ
 0j/AVVjFttaVt0dHOV/LKSWCEiZas/H9Oyd2/W+xXQHE1L9qywFvkDOUkQpojIRCLUUL
 Ss1xGSesnnuulO3P/WF9TbpAVXAHuCb50CZr7eyF/gbPevkAxizmaRsIQi7ZOaE21ACh
 Ns6g==
X-Gm-Message-State: APjAAAW6uJYTikBhBO9k+PdhGo26MgYnOmHTnLcH2J0qhRHNWIT8sPVx
 Yj3CFX+OoNPV+2I3dssSquJkJgO5vHiTaJMfuIjAEstL
X-Google-Smtp-Source: APXvYqw3v8HoXcTI+8epomCxZtZ3gFVGt7miwRSSw5G1CbE8VIUlo8PwFejv33VA1q4l/qNZ0LeBlAZs1pnVmyJmN3c=
X-Received: by 2002:ae9:ef4a:: with SMTP id d71mr9244580qkg.257.1572992468307; 
 Tue, 05 Nov 2019 14:21:08 -0800 (PST)
MIME-Version: 1.0
References: <CAEk+mvvz1SJQD0Yo8s0oB8=jN4yh2ZbURmZ8Ln1VKxcfBE96DQ@mail.gmail.com>
 <20191011101243.GI1208@intel.com>
 <CAEk+mvtupRAM9TX6q0v=Zsq3EFRkxFkH0sxfKMUdDPKMczUOwg@mail.gmail.com>
In-Reply-To: <CAEk+mvtupRAM9TX6q0v=Zsq3EFRkxFkH0sxfKMUdDPKMczUOwg@mail.gmail.com>
From: John Maguire <jmaguire2013@gmail.com>
Date: Tue, 5 Nov 2019 17:20:56 -0500
Message-ID: <CAEk+mvsW=1OJBYf9amB2y3+AdC_aDzqvmO3hECwuOxhZOz==rw@mail.gmail.com>
Subject: Re: Kernel crash on 4.19.77-1-lts (Arch Linux / ThinkPad T470p)
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: multipart/mixed; boundary="0000000000004eeef90596a0d920"
X-Mailman-Approved-At: Wed, 06 Nov 2019 07:33:32 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=aus42zVQdD/RHTyJA1fIBvJ1pjPROj7oAL3RvLlSe8Y=;
 b=nuGF4lLSpgdJm+yVh+UrB8+EbIY3GWJ+HMbg+cLG1jmzA5g5qRFI0XJszt0yvDBgol
 C9VJPG9FNd03c2MX4MH9RDD5UmE2o9n2K2YAf71p2A7Aek68L/3KP6LAw5uvLBd8cPwK
 kxM5yHk6B6SrAskWlLP8rdW7jmQyRwcZ3GvJ2op3UPcARZSjyVGscPUy0j7zA4Dkja72
 bsD8mEQCwSvaRG0t877FtBRLjk8+vy4e2onl2cpzfJpGlEITtDyqfviuQPdHfOcXW5oY
 BpHATPHURpzwJXF/QmDvekBjZ8mEia4oMs4AnpJOi7/wagnkLV91mUhG74Zkvi+r8X6A
 jrKA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000004eeef90596a0d920
Content-Type: multipart/alternative; boundary="0000000000004eeef60596a0d91e"

--0000000000004eeef60596a0d91e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Continuing to see crashes, most recently on 4.19.81-1-lts



On Fri, Oct 11, 2019 at 11:33 AM John Maguire <jmaguire2013@gmail.com>
wrote:

> > Just use Cc. We want all replies to go to the list(s) as well.
> Sorry, I wasn't sure and wanted to err on the side of not spamming the
> wrong people.
>
> > Oct 10 12:53:30 scorpion kernel: RIP:
> 0010:dma_fence_signal_locked+0x30/0xe0
>
> >
> > Looks like it could be
> > https://bugs.freedesktop.org/show_bug.cgi?id=3D111381
> >
> > in which case you just need to upgrade to 4.19.78 and it should be
> > fixed.
>
> Thanks a bunch, not sure how I missed there was a new LTS kernel out. I
> have upgraded and will report back if I continue to see the issue.
>
> Thanks for the quick support,
> John
>
> On Fri, Oct 11, 2019 at 6:12 AM Ville Syrj=C3=A4l=C3=A4 <
> ville.syrjala@linux.intel.com> wrote:
>
>> On Thu, Oct 10, 2019 at 01:15:09PM -0400, John Maguire wrote:
>> > Hi there,
>> >
>> > I wasn't sure which mailing list to use so I BCC'd
>> > intel-gfx@lists.freedesktop.org and dri-devel@lists.freedesktop.org
>>
>> Just use Cc. We want all replies to go to the list(s) as well.
>>
>> >
>> > I'm using a Lenovo Thinkpad T470p and running the 4.19.77-1-lts kernel
>> on
>> > Arch Linux. Recently, I've started getting freezes each day. Audio can
>> > still be heard, but video output stops. I was able to retrieve a call
>> trace
>> > from journald.
>> >
>> > I've attached the output of "sudo lspci -vvv" as well as the message
>> from
>> > journald (null pointer dereference).
>>
>> Oct 10 12:53:30 scorpion kernel: RIP:
>> 0010:dma_fence_signal_locked+0x30/0xe0
>>
>>
>> Looks like it could be
>> https://bugs.freedesktop.org/show_bug.cgi?id=3D111381
>>
>> in which case you just need to upgrade to 4.19.78 and it should be
>> fixed.
>>
>> --
>> Ville Syrj=C3=A4l=C3=A4
>> Intel
>>
>

--0000000000004eeef60596a0d91e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Continuing to see crashes, most recently on 4.19.81-1-lts<=
div><br></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Oct 11, 2019 at 11:33 AM John Maguire=
 &lt;<a href=3D"mailto:jmaguire2013@gmail.com">jmaguire2013@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr">&gt; Just use Cc. We want all replies to go to the list(s) as we=
ll.<span style=3D"color:rgb(80,0,80)"><br></span><div>Sorry, I wasn&#39;t s=
ure and wanted to err on the side of not spamming the wrong people.</div><d=
iv><br></div><div>&gt; Oct 10 12:53:30 scorpion kernel: RIP: 0010:dma_fence=
_signal_locked+0x30/0xe0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div>&gt;=C2=A0<br>&gt; Looks like it could=
 be<br>&gt;=C2=A0<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111381" rel=3D"noreferrer" target=3D"_blank">https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111381</a><br>&gt;=C2=A0<br>&gt; in which case you just ne=
ed to upgrade to 4.19.78 and it should be<br>&gt; fixed.<span><font color=
=3D"#888888"><br></font></span><div><br></div><div>Thanks a bunch, not sure=
 how I missed there was a new LTS kernel out. I have upgraded and will repo=
rt back if I continue to see the issue.</div><div><br></div><div>Thanks for=
 the quick support,</div><div>John</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 11, 2019 at 6:12 AM Vil=
le Syrj=C3=A4l=C3=A4 &lt;<a href=3D"mailto:ville.syrjala@linux.intel.com" t=
arget=3D"_blank">ville.syrjala@linux.intel.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Oct 10, 2019 at 01:15=
:09PM -0400, John Maguire wrote:<br>
&gt; Hi there,<br>
&gt; <br>
&gt; I wasn&#39;t sure which mailing list to use so I BCC&#39;d<br>
&gt; <a href=3D"mailto:intel-gfx@lists.freedesktop.org" target=3D"_blank">i=
ntel-gfx@lists.freedesktop.org</a> and <a href=3D"mailto:dri-devel@lists.fr=
eedesktop.org" target=3D"_blank">dri-devel@lists.freedesktop.org</a><br>
<br>
Just use Cc. We want all replies to go to the list(s) as well.<br>
<br>
&gt; <br>
&gt; I&#39;m using a Lenovo Thinkpad T470p and running the 4.19.77-1-lts ke=
rnel on<br>
&gt; Arch Linux. Recently, I&#39;ve started getting freezes each day. Audio=
 can<br>
&gt; still be heard, but video output stops. I was able to retrieve a call =
trace<br>
&gt; from journald.<br>
&gt; <br>
&gt; I&#39;ve attached the output of &quot;sudo lspci -vvv&quot; as well as=
 the message from<br>
&gt; journald (null pointer dereference).<br>
<br>
Oct 10 12:53:30 scorpion kernel: RIP: 0010:dma_fence_signal_locked+0x30/0xe=
0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <br>
<br>
Looks like it could be<br>
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111381" rel=3D"no=
referrer" target=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111381</a><br>
<br>
in which case you just need to upgrade to 4.19.78 and it should be<br>
fixed.<br>
<br>
-- <br>
Ville Syrj=C3=A4l=C3=A4<br>
Intel<br>
</blockquote></div>
</blockquote></div>

--0000000000004eeef60596a0d91e--

--0000000000004eeef90596a0d920
Content-Type: application/octet-stream; name=trace
Content-Disposition: attachment; filename=trace
Content-Transfer-Encoding: base64
Content-ID: <f_k2mf36em0>
X-Attachment-Id: f_k2mf36em0

Tm92IDA1IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogQlVHOiB1bmFibGUgdG8gaGFuZGxlIGtl
cm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgMDAwMDAwMDAwMDAwMDAwMApOb3YgMDUg
MTc6MTI6NDkgc2NvcnBpb24ga2VybmVsOiBQR0QgMCBQNEQgMApOb3YgMDUgMTc6MTI6NDkgc2Nv
cnBpb24ga2VybmVsOiBPb3BzOiAwMDAwIFsjMV0gU01QIFBUSQpOb3YgMDUgMTc6MTI6NDkgc2Nv
cnBpb24ga2VybmVsOiBDUFU6IDMgUElEOiAxNDY3IENvbW06IGNocm9tZSBUYWludGVkOiBHICAg
ICAgICAgICBPRSAgICAgNC4xOS44MS0xLWx0cyAjMQpOb3YgMDUgMTc6MTI6NDkgc2NvcnBpb24g
a2VybmVsOiBIYXJkd2FyZSBuYW1lOiBMRU5PVk8gMjBKNjAwM0pVUy8yMEo2MDAzSlVTLCBCSU9T
IFIwRkVUNDRXICgxLjI0ICkgMDgvMDgvMjAxOApOb3YgMDUgMTc6MTI6NDkgc2NvcnBpb24ga2Vy
bmVsOiBSSVA6IDAwMTA6ZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQrMHgzMC8weGUwCk5vdiAwNSAx
NzoxMjo0OSBzY29ycGlvbiBrZXJuZWw6IENvZGU6IDU2IDQxIDU1IDQxIDU0IDU1IDUzIDQ4IDg1
IGZmIDBmIDg0IDcyIDBiIDAwIDAwIDQ5IDg5IGZlIGYwIDQ4IDBmIGJhIDZmIDQ4IDAwIDQxIGJk
IGVhIGZmIGZmIGZmIDczIDRlIDQ5IDhiIDc2IDIwIDRkIDhkIDY2IDIwIDw0OD4gOGIgMWUgNDgg
ODk+Ck5vdiAwNSAxNzoxMjo0OSBzY29ycGlvbiBrZXJuZWw6IFJTUDogMDAxODpmZmZmYjYwMjQz
NTZiYTU4IEVGTEFHUzogMDAwMTAwNDYKTm92IDA1IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDog
UkFYOiAwMDAwNTg5ZGViNmNiYjlkIFJCWDogZmZmZjlhMDY3YWUzNjA0MCBSQ1g6IDAwMDAwMDAw
MDAwMDAwMTgKTm92IDA1IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogUkRYOiAwMDAwMzA1MTVk
ZjM4NDdlIFJTSTogMDAwMDAwMDAwMDAwMDAwMCBSREk6IGZmZmZmZmZmOWU4MjM1NjAKTm92IDA1
IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogUkJQOiBmZmZmOWEwNDgwOGU4NTAwIFIwODogMDAw
MDAwMDAwMDAwMDAwMCBSMDk6IGZmZmZmZmZmYzExYWQxYTUKTm92IDA1IDE3OjEyOjQ5IHNjb3Jw
aW9uIGtlcm5lbDogUjEwOiBmZmZmOWEwNjgxMDAzYjAwIFIxMTogMDAwMDAwMDAwMDAwMDMzOCBS
MTI6IGZmZmY5YTA2N2FlMzVlNTgKTm92IDA1IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogUjEz
OiAwMDAwMDAwMDAwMDAwMDAwIFIxNDogZmZmZjlhMDY3YWUzNWUzOCBSMTU6IGZmZmY5YTA2N2Fl
MzVlMzgKTm92IDA1IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogRlM6ICAwMDAwN2ZkNWUzMzM5
YzgwKDAwMDApIEdTOmZmZmY5YTA2ODE0YzAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAw
MApOb3YgMDUgMTc6MTI6NDkgc2NvcnBpb24ga2VybmVsOiBDUzogIDAwMTAgRFM6IDAwMDAgRVM6
IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCk5vdiAwNSAxNzoxMjo0OSBzY29ycGlvbiBrZXJu
ZWw6IENSMjogMDAwMDAwMDAwMDAwMDAwMCBDUjM6IDAwMDAwMDA0MmI0N2EwMDQgQ1I0OiAwMDAw
MDAwMDAwMzYwNmUwCk5vdiAwNSAxNzoxMjo0OSBzY29ycGlvbiBrZXJuZWw6IERSMDogMDAwMDAw
MDAwMDAwMDAwMCBEUjE6IDAwMDAwMDAwMDAwMDAwMDAgRFIyOiAwMDAwMDAwMDAwMDAwMDAwCk5v
diAwNSAxNzoxMjo0OSBzY29ycGlvbiBrZXJuZWw6IERSMzogMDAwMDAwMDAwMDAwMDAwMCBEUjY6
IDAwMDAwMDAwZmZmZTBmZjAgRFI3OiAwMDAwMDAwMDAwMDAwNDAwCk5vdiAwNSAxNzoxMjo0OSBz
Y29ycGlvbiBrZXJuZWw6IENhbGwgVHJhY2U6Ck5vdiAwNSAxNzoxMjo0OSBzY29ycGlvbiBrZXJu
ZWw6ICBpOTE1X3JlcXVlc3RfcmV0aXJlKzB4MjUyLzB4NDMwIFtpOTE1XQpOb3YgMDUgMTc6MTI6
NDkgc2NvcnBpb24ga2VybmVsOiAgaTkxNV9yZXF1ZXN0X2FkZCsweDM0Yy8weDM4MCBbaTkxNV0K
Tm92IDA1IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogIGk5MTVfZ2VtX2RvX2V4ZWNidWZmZXIr
MHhhMjkvMHhmMTAgW2k5MTVdCk5vdiAwNSAxNzoxMjo0OSBzY29ycGlvbiBrZXJuZWw6ICA/IHJl
bW92ZV93YWl0X3F1ZXVlKzB4MTIvMHg1MApOb3YgMDUgMTc6MTI6NDkgc2NvcnBpb24ga2VybmVs
OiAgPyBpOTE1X3JlcXVlc3Rfd2FpdCsweDMxYS8weDU4MCBbaTkxNV0KTm92IDA1IDE3OjEyOjQ5
IHNjb3JwaW9uIGtlcm5lbDogIGk5MTVfZ2VtX2V4ZWNidWZmZXIyX2lvY3RsKzB4MWM1LzB4MzUw
IFtpOTE1XQpOb3YgMDUgMTc6MTI6NDkgc2NvcnBpb24ga2VybmVsOiAgPyBpOTE1X2dlbV9leGVj
YnVmZmVyX2lvY3RsKzB4MmIwLzB4MmIwIFtpOTE1XQpOb3YgMDUgMTc6MTI6NDkgc2NvcnBpb24g
a2VybmVsOiAgZHJtX2lvY3RsX2tlcm5lbCsweGE0LzB4ZjAgW2RybV0KTm92IDA1IDE3OjEyOjQ5
IHNjb3JwaW9uIGtlcm5lbDogIGRybV9pb2N0bCsweDIzNy8weDQxMCBbZHJtXQpOb3YgMDUgMTc6
MTI6NDkgc2NvcnBpb24ga2VybmVsOiAgPyBpOTE1X2dlbV9leGVjYnVmZmVyX2lvY3RsKzB4MmIw
LzB4MmIwIFtpOTE1XQpOb3YgMDUgMTc6MTI6NDkgc2NvcnBpb24ga2VybmVsOiAgPyB2ZnNfd3Jp
dGV2KzB4YTAvMHhmMApOb3YgMDUgMTc6MTI6NDkgc2NvcnBpb24ga2VybmVsOiAgZG9fdmZzX2lv
Y3RsKzB4NDBlLzB4NjcwCk5vdiAwNSAxNzoxMjo0OSBzY29ycGlvbiBrZXJuZWw6ICA/IHN5c2Nh
bGxfc2xvd19leGl0X3dvcmsrMHgxOGMvMHgxYTAKTm92IDA1IDE3OjEyOjQ5IHNjb3JwaW9uIGtl
cm5lbDogIGtzeXNfaW9jdGwrMHg1ZS8weDkwCk5vdiAwNSAxNzoxMjo0OSBzY29ycGlvbiBrZXJu
ZWw6ICBfX3g2NF9zeXNfaW9jdGwrMHgxNi8weDIwCk5vdiAwNSAxNzoxMjo0OSBzY29ycGlvbiBr
ZXJuZWw6ICBkb19zeXNjYWxsXzY0KzB4NGUvMHgxMDAKTm92IDA1IDE3OjEyOjQ5IHNjb3JwaW9u
IGtlcm5lbDogIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKTm92IDA1
IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogUklQOiAwMDMzOjB4N2ZkNWU0ZWJiMjViCk5vdiAw
NSAxNzoxMjo0OSBzY29ycGlvbiBrZXJuZWw6IENvZGU6IDBmIDFlIGZhIDQ4IDhiIDA1IDI1IDlj
IDBjIDAwIDY0IGM3IDAwIDI2IDAwIDAwIDAwIDQ4IGM3IGMwIGZmIGZmIGZmIGZmIGMzIDY2IDBm
IDFmIDQ0IDAwIDAwIGYzIDBmIDFlIGZhIGI4IDEwIDAwIDAwIDAwIDBmIDA1IDw0OD4gM2QgMDEg
ZjAgZmY+Ck5vdiAwNSAxNzoxMjo0OSBzY29ycGlvbiBrZXJuZWw6IFJTUDogMDAyYjowMDAwN2Zm
ZmI4MmQ1ZGU4IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAwMTAKTm92
IDA1IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDog
MDAwMDdmZmZiODJkNWUzMCBSQ1g6IDAwMDA3ZmQ1ZTRlYmIyNWIKTm92IDA1IDE3OjEyOjQ5IHNj
b3JwaW9uIGtlcm5lbDogUkRYOiAwMDAwN2ZmZmI4MmQ1ZTMwIFJTSTogMDAwMDAwMDA0MDQwNjQ2
OSBSREk6IDAwMDAwMDAwMDAwMDAwMGUKTm92IDA1IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDog
UkJQOiAwMDAwMDAwMDQwNDA2NDY5IFIwODogMDAwMDFlZmU4NTIwZTEwMCBSMDk6IDAwMDAwMDAw
MDAwMDAwMDAKTm92IDA1IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogUjEwOiAwMDAwMDAwMDAw
MDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IDAwMDAxZWZlODYwNTEwMzAKTm92IDA1
IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogUjEzOiAwMDAwMDAwMDAwMDAwMDBlIFIxNDogZmZm
ZmZmZmZmZmZmZmZmZiBSMTU6IDAwMDA3ZmQ1ZTE2OWFkNjgKTm92IDA1IDE3OjEyOjQ5IHNjb3Jw
aW9uIGtlcm5lbDogTW9kdWxlcyBsaW5rZWQgaW46IHVpbnB1dCBjY20gcmZjb21tIHh0X25hdCB4
dF90Y3B1ZHAgdmV0aCB4dF9jb25udHJhY2sgaXB0X01BU1FVRVJBREUgbmZfY29ubnRyYWNrX25l
dGxpbmsgbmZuZXRsaW5rIHhmcm1fdXNlciB4ZnJtX2FsZ28geHRfYWRkcnR5cD4KTm92IDA1IDE3
OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogIG1paSBtYWM4MDIxMSBrdm0gbXhtX3dtaSB0dG0gc25k
X3VzYl9hdWRpbyBpcnFieXBhc3MgaTJjX2FsZ29fYml0IHV2Y3ZpZGVvIGRybV9rbXNfaGVscGVy
IHNuZF91c2JtaWRpX2xpYiB2aWRlb2J1ZjJfdm1hbGxvYyBpd2x3aWZpIHZpZGVvYnVmMl9tZW1v
cD4KTm92IDA1IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogIHBjYmMgcnRzeF9wY2lfc2RtbWMg
c2VyaW9fcmF3IGF0a2JkIG1tY19jb3JlIGxpYnBzMiBhZXNuaV9pbnRlbCBhZXNfeDg2XzY0IHho
Y2lfcGNpIGNyeXB0b19zaW1kIGNyeXB0ZCBnbHVlX2hlbHBlciB4aGNpX2hjZCBydHN4X3BjaSBp
ODA0MiBzZXJpbwpOb3YgMDUgMTc6MTI6NDkgc2NvcnBpb24ga2VybmVsOiBDUjI6IDAwMDAwMDAw
MDAwMDAwMDAKTm92IDA1IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogLS0tWyBlbmQgdHJhY2Ug
Y2M2Nzk3MjdjZjkyODFhMCBdLS0tCk5vdiAwNSAxNzoxMjo0OSBzY29ycGlvbiBrZXJuZWw6IFJJ
UDogMDAxMDpkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZCsweDMwLzB4ZTAKTm92IDA1IDE3OjEyOjQ5
IHNjb3JwaW9uIGtlcm5lbDogQ29kZTogNTYgNDEgNTUgNDEgNTQgNTUgNTMgNDggODUgZmYgMGYg
ODQgNzIgMGIgMDAgMDAgNDkgODkgZmUgZjAgNDggMGYgYmEgNmYgNDggMDAgNDEgYmQgZWEgZmYg
ZmYgZmYgNzMgNGUgNDkgOGIgNzYgMjAgNGQgOGQgNjYgMjAgPDQ4PiA4YiAxZSA0OCA4OT4KTm92
IDA1IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogUlNQOiAwMDE4OmZmZmZiNjAyNDM1NmJhNTgg
RUZMQUdTOiAwMDAxMDA0NgpOb3YgMDUgMTc6MTI6NDkgc2NvcnBpb24ga2VybmVsOiBSQVg6IDAw
MDA1ODlkZWI2Y2JiOWQgUkJYOiBmZmZmOWEwNjdhZTM2MDQwIFJDWDogMDAwMDAwMDAwMDAwMDAx
OApOb3YgMDUgMTc6MTI6NDkgc2NvcnBpb24ga2VybmVsOiBSRFg6IDAwMDAzMDUxNWRmMzg0N2Ug
UlNJOiAwMDAwMDAwMDAwMDAwMDAwIFJESTogZmZmZmZmZmY5ZTgyMzU2MApOb3YgMDUgMTc6MTI6
NDkgc2NvcnBpb24ga2VybmVsOiBSQlA6IGZmZmY5YTA0ODA4ZTg1MDAgUjA4OiAwMDAwMDAwMDAw
MDAwMDAwIFIwOTogZmZmZmZmZmZjMTFhZDFhNQpOb3YgMDUgMTc6MTI6NDkgc2NvcnBpb24ga2Vy
bmVsOiBSMTA6IGZmZmY5YTA2ODEwMDNiMDAgUjExOiAwMDAwMDAwMDAwMDAwMzM4IFIxMjogZmZm
ZjlhMDY3YWUzNWU1OApOb3YgMDUgMTc6MTI6NDkgc2NvcnBpb24ga2VybmVsOiBSMTM6IDAwMDAw
MDAwMDAwMDAwMDAgUjE0OiBmZmZmOWEwNjdhZTM1ZTM4IFIxNTogZmZmZjlhMDY3YWUzNWUzOApO
b3YgMDUgMTc6MTI6NDkgc2NvcnBpb24ga2VybmVsOiBGUzogIDAwMDA3ZmQ1ZTMzMzljODAoMDAw
MCkgR1M6ZmZmZjlhMDY4MTRjMDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCk5vdiAw
NSAxNzoxMjo0OSBzY29ycGlvbiBrZXJuZWw6IENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBD
UjA6IDAwMDAwMDAwODAwNTAwMzMKTm92IDA1IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogQ1Iy
OiAwMDAwMDAwMDAwMDAwMDAwIENSMzogMDAwMDAwMDQyYjQ3YTAwNCBDUjQ6IDAwMDAwMDAwMDAz
NjA2ZTAKTm92IDA1IDE3OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogRFIwOiAwMDAwMDAwMDAwMDAw
MDAwIERSMTogMDAwMDAwMDAwMDAwMDAwMCBEUjI6IDAwMDAwMDAwMDAwMDAwMDAKTm92IDA1IDE3
OjEyOjQ5IHNjb3JwaW9uIGtlcm5lbDogRFIzOiAwMDAwMDAwMDAwMDAwMDAwIERSNjogMDAwMDAw
MDBmZmZlMGZmMCBEUjc6IDAwMDAwMDAwMDAwMDA0MDAK
--0000000000004eeef90596a0d920
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--0000000000004eeef90596a0d920--
