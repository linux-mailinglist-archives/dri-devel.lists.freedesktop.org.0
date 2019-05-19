Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52246225BD
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 06:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B65890A5;
	Sun, 19 May 2019 04:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B43D4890D8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 04:15:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B0BAD72167; Sun, 19 May 2019 04:15:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110701] GPU faults in in Unigine Valley 1.0
Date: Sun, 19 May 2019 04:15:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwidmer@umbrox.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-110701-502-MSeRkpOFiF@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110701-502@http.bugs.freedesktop.org/>
References: <bug-110701-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0765946388=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0765946388==
Content-Type: multipart/alternative; boundary="15582393392.A594.12849"
Content-Transfer-Encoding: 7bit


--15582393392.A594.12849
Date: Sun, 19 May 2019 04:15:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110701

Christian Widmer <cwidmer@umbrox.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |cwidmer@umbrox.de

--- Comment #7 from Christian Widmer <cwidmer@umbrox.de> ---
(In reply to Yury Zhuravlev from comment #6)
> 78e35df52aa2f7d770f929a0866a0faa89c261a9 radeonsi: update buffer descript=
ors
> in all contexts after buffer invalidation

That is the commit I identified in comment #1 as being responsible for my
issues. I would not be surprised if reverting that one makes your faults
disappear as well.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15582393392.A594.12849
Date: Sun, 19 May 2019 04:15:39 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:cwidmer&#=
64;umbrox.de" title=3D"Christian Widmer &lt;cwidmer&#64;umbrox.de&gt;"> <sp=
an class=3D"fn">Christian Widmer</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU faults in in Unigine Valley 1.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110701">bug 11070=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>cwidmer&#64;umbrox.de
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU faults in in Unigine Valley 1.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110701#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU faults in in Unigine Valley 1.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110701">bug 11070=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cwidmer&#64;umbrox.de" title=3D"Christian Widmer &lt;cwidmer&#64;umbrox.de&=
gt;"> <span class=3D"fn">Christian Widmer</span></a>
</span></b>
        <pre>(In reply to Yury Zhuravlev from <a href=3D"show_bug.cgi?id=3D=
110701#c6">comment #6</a>)
<span class=3D"quote">&gt; 78e35df52aa2f7d770f929a0866a0faa89c261a9 radeons=
i: update buffer descriptors
&gt; in all contexts after buffer invalidation</span >

That is the commit I identified in <a href=3D"show_bug.cgi?id=3D110701#c1">=
comment #1</a> as being responsible for my
issues. I would not be surprised if reverting that one makes your faults
disappear as well.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15582393392.A594.12849--

--===============0765946388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0765946388==--
