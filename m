Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D435419B9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 02:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AABA89023;
	Wed, 12 Jun 2019 00:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6FC3189023
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 00:54:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 638CC72167; Wed, 12 Jun 2019 00:54:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Wed, 12 Jun 2019 00:54:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110897-502-EMRP1Lq63i@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110897-502@http.bugs.freedesktop.org/>
References: <bug-110897-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============0817949602=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0817949602==
Content-Type: multipart/alternative; boundary="15603008660.ABF7E.5951"
Content-Transfer-Encoding: 7bit


--15603008660.ABF7E.5951
Date: Wed, 12 Jun 2019 00:54:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #7 from Richard Thier <u9vata@gmail.com> ---
Created attachment 144515
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144515&action=3Dedit
Log output for "added logging" patch

As you can see the "KUL-D" and the "KULAKVA-n" log messages never gets prin=
ted
out but the KUL-A gets to be and even "KUL-C" now for some reason.

I expect we should have emitted the flush, zmask clear and/or hiz clear, bu=
t it
seems we are not ever getting at that code path.

I am wondering what might be the value of the "buffer" variable here as all=
 I
know is that it is not empty, but I think the code is written in the way th=
at
it expects that it is and only do the emit operations if it is empty. Maybe=
 a
new kind of buffer was added and code did not changed or who knows... then =
it
can be a regression actually... but I have no idea why it might work for an=
yone
then...

But look at the log and the patch. For me it is weird what is happening.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15603008660.ABF7E.5951
Date: Wed, 12 Jun 2019 00:54:26 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144515=
" name=3D"attach_144515" title=3D"Log output for &quot;added logging&quot; =
patch">attachment 144515</a> <a href=3D"attachment.cgi?id=3D144515&amp;acti=
on=3Dedit" title=3D"Log output for &quot;added logging&quot; patch">[detail=
s]</a></span>
Log output for &quot;added logging&quot; patch

As you can see the &quot;KUL-D&quot; and the &quot;KULAKVA-n&quot; log mess=
ages never gets printed
out but the KUL-A gets to be and even &quot;KUL-C&quot; now for some reason.

I expect we should have emitted the flush, zmask clear and/or hiz clear, bu=
t it
seems we are not ever getting at that code path.

I am wondering what might be the value of the &quot;buffer&quot; variable h=
ere as all I
know is that it is not empty, but I think the code is written in the way th=
at
it expects that it is and only do the emit operations if it is empty. Maybe=
 a
new kind of buffer was added and code did not changed or who knows... then =
it
can be a regression actually... but I have no idea why it might work for an=
yone
then...

But look at the log and the patch. For me it is weird what is happening.</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15603008660.ABF7E.5951--

--===============0817949602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0817949602==--
