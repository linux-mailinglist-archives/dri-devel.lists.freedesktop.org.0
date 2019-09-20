Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A17B8B06
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 08:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8E86ECA0;
	Fri, 20 Sep 2019 06:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D3DE26EDE6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 06:27:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C8B2872168; Fri, 20 Sep 2019 06:27:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Fri, 20 Sep 2019 06:27:42 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: git@dougty.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111481-502-VCWQjBRZAp@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1587932376=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1587932376==
Content-Type: multipart/alternative; boundary="15689608621.5867D1A.4379"
Content-Transfer-Encoding: 7bit


--15689608621.5867D1A.4379
Date: Fri, 20 Sep 2019 06:27:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #54 from Doug Ty <git@dougty.com> ---
Created attachment 145439
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145439&action=3Dedit
Additional log of divide error

(In reply to Matthias M=C3=BCller from comment #52)
> Comment on attachment 145436 [details]
> Log of divide error
>=20
> i just encountered a "random" freeze, too.
> And because it seems to be something "new", i thought i'd post it here -
> seems to be some kind of null pointer from what i found?

I've also been getting this, albeit very rarely. It doesn't seem to happen =
with
older firmware (ie. Jul 14th firmware extracted from Fedora's linux-firmware
package), only the newer firmware from the ~agd5f/radeon_ucode repo causes
this.

I figured maybe it had to do with PCIe bandwidth, but it occurs on 3.0 as w=
ell
as 4.0. Even occurs with system-wide AMD_DEBUG=3Dnodma in my /etc/environme=
nt.
There is no amdgpu error in journalctl, just the above. Screen freezes & I =
have
to reboot with REISUB.

Perhaps this is a different issue, and if so, perhaps we should make a sepa=
rate
bug report for it?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15689608621.5867D1A.4379
Date: Fri, 20 Sep 2019 06:27:42 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c54">Comme=
nt # 54</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
git&#64;dougty.com" title=3D"Doug Ty &lt;git&#64;dougty.com&gt;"> <span cla=
ss=3D"fn">Doug Ty</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145439=
" name=3D"attach_145439" title=3D"Additional log of divide error">attachmen=
t 145439</a> <a href=3D"attachment.cgi?id=3D145439&amp;action=3Dedit" title=
=3D"Additional log of divide error">[details]</a></span>
Additional log of divide error

(In reply to Matthias M=C3=BCller from <a href=3D"show_bug.cgi?id=3D111481#=
c52">comment #52</a>)
<span class=3D"quote">&gt; Comment on <span class=3D""><a href=3D"attachmen=
t.cgi?id=3D145436" name=3D"attach_145436" title=3D"Log of divide error">att=
achment 145436</a> <a href=3D"attachment.cgi?id=3D145436&amp;action=3Dedit"=
 title=3D"Log of divide error">[details]</a></span>
&gt; Log of divide error
&gt;=20
&gt; i just encountered a &quot;random&quot; freeze, too.
&gt; And because it seems to be something &quot;new&quot;, i thought i'd po=
st it here -
&gt; seems to be some kind of null pointer from what i found?</span >

I've also been getting this, albeit very rarely. It doesn't seem to happen =
with
older firmware (ie. Jul 14th firmware extracted from Fedora's linux-firmware
package), only the newer firmware from the ~agd5f/radeon_ucode repo causes
this.

I figured maybe it had to do with PCIe bandwidth, but it occurs on 3.0 as w=
ell
as 4.0. Even occurs with system-wide AMD_DEBUG=3Dnodma in my /etc/environme=
nt.
There is no amdgpu error in journalctl, just the above. Screen freezes &amp=
; I have
to reboot with REISUB.

Perhaps this is a different issue, and if so, perhaps we should make a sepa=
rate
bug report for it?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15689608621.5867D1A.4379--

--===============1587932376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1587932376==--
