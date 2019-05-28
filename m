Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9992C77D
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 15:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9338949C;
	Tue, 28 May 2019 13:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id DAEA08949C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 13:11:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D7E0B72167; Tue, 28 May 2019 13:11:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110783] Mesa 19.1 rc crashing MPV with VAAPI
Date: Tue, 28 May 2019 13:11:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r600
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: angrypenguinpoland@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110783-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1370542494=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1370542494==
Content-Type: multipart/alternative; boundary="15590490761.357b7.19871"
Content-Transfer-Encoding: 7bit


--15590490761.357b7.19871
Date: Tue, 28 May 2019 13:11:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110783

            Bug ID: 110783
           Summary: Mesa 19.1 rc crashing MPV with VAAPI
           Product: Mesa
           Version: 19.1
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/r600
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: angrypenguinpoland@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 144362
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144362&action=3Dedit
xorg

Hi.

I noticed that after the Mesa upgrade from stable 19.0X to 19.1rc when tryi=
ng
to play MPV video with VAAPI it crashing MPV with this error:

Playing: /VID_20150204_135614.m4v
 (+) Video --vid=3D1 (*) (mpeg4 17.570fps)
 (+) Audio --aid=3D1 --alang=3Deng (*) (amr_nb 1ch 8000Hz)
AO: [pulse] 8000Hz mono 1ch float
VO: [vdpau] 640x480 yuv420p
[vo/vdpau] Compositing window manager detected. Assuming timing info is
inaccurate.
EE ../src/gallium/drivers/r600/r600_shader.c:4290 tgsi_unsupported - DIV tg=
si
opcode unsupported
EE ../src/gallium/drivers/r600/r600_shader.c:185 r600_pipe_shader_create -
translation from TGSI failed !
EE ../src/gallium/drivers/r600/r600_state_common.c:879 r600_shader_select -
Failed to build shader variant (type=3D5) -22
EE ../src/gallium/drivers/r600/r600_shader.c:4290 tgsi_unsupported - DIV tg=
si
opcode unsupported
EE ../src/gallium/drivers/r600/r600_shader.c:185 r600_pipe_shader_create -
translation from TGSI failed !
EE ../src/gallium/drivers/r600/r600_state_common.c:879 r600_shader_select -
Failed to build shader variant (type=3D5) -22

Violation of memory protection (memory dump) <- (last line translated)

It worked fine on Mesa 19.0X, it began crash after upgrade to Mesa 19.1rc2 =
and
19.1rc3.
Trying libva 2.4.0 and also libva 2.4.1 - same results.

MPV crashing at default launch options. Crashing also with --vo=3Dvaapi or
--vo=3Dvdpau.
Not crashing with --vo=3Dgpu or --vo=3Dxv

Worth to add other video players like VLC not crashing wit VAAPI. Only MPV.

Details:
Linux OpenMandriva Lx 4 x86_64
Kernel 5.1.5
Mesa 19.1rc2/3
libva 2.4.0/2.4.1

Tested on two computers with R600, one PC with Radeon HD5850 and notebook w=
ith
Radeon HD5650m.

In attachment output of xorg log.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15590490761.357b7.19871
Date: Tue, 28 May 2019 13:11:16 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Mesa 19.1 rc crashing MPV with VAAPI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110783">110783</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Mesa 19.1 rc crashing MPV with VAAPI
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.1
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/Gallium/r600
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>angrypenguinpoland&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144362=
" name=3D"attach_144362" title=3D"xorg">attachment 144362</a> <a href=3D"at=
tachment.cgi?id=3D144362&amp;action=3Dedit" title=3D"xorg">[details]</a></s=
pan>
xorg

Hi.

I noticed that after the Mesa upgrade from stable 19.0X to 19.1rc when tryi=
ng
to play MPV video with VAAPI it crashing MPV with this error:

Playing: /VID_20150204_135614.m4v
 (+) Video --vid=3D1 (*) (mpeg4 17.570fps)
 (+) Audio --aid=3D1 --alang=3Deng (*) (amr_nb 1ch 8000Hz)
AO: [pulse] 8000Hz mono 1ch float
VO: [vdpau] 640x480 yuv420p
[vo/vdpau] Compositing window manager detected. Assuming timing info is
inaccurate.
EE ../src/gallium/drivers/r600/r600_shader.c:4290 tgsi_unsupported - DIV tg=
si
opcode unsupported
EE ../src/gallium/drivers/r600/r600_shader.c:185 r600_pipe_shader_create -
translation from TGSI failed !
EE ../src/gallium/drivers/r600/r600_state_common.c:879 r600_shader_select -
Failed to build shader variant (type=3D5) -22
EE ../src/gallium/drivers/r600/r600_shader.c:4290 tgsi_unsupported - DIV tg=
si
opcode unsupported
EE ../src/gallium/drivers/r600/r600_shader.c:185 r600_pipe_shader_create -
translation from TGSI failed !
EE ../src/gallium/drivers/r600/r600_state_common.c:879 r600_shader_select -
Failed to build shader variant (type=3D5) -22

Violation of memory protection (memory dump) &lt;- (last line translated)

It worked fine on Mesa 19.0X, it began crash after upgrade to Mesa 19.1rc2 =
and
19.1rc3.
Trying libva 2.4.0 and also libva 2.4.1 - same results.

MPV crashing at default launch options. Crashing also with --vo=3Dvaapi or
--vo=3Dvdpau.
Not crashing with --vo=3Dgpu or --vo=3Dxv

Worth to add other video players like VLC not crashing wit VAAPI. Only MPV.

Details:
Linux OpenMandriva Lx 4 x86_64
Kernel 5.1.5
Mesa 19.1rc2/3
libva 2.4.0/2.4.1

Tested on two computers with R600, one PC with Radeon HD5850 and notebook w=
ith
Radeon HD5650m.

In attachment output of xorg log.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15590490761.357b7.19871--

--===============1370542494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1370542494==--
