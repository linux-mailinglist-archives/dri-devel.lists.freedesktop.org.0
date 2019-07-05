Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B66B5FEF2
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 02:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425696E3E9;
	Fri,  5 Jul 2019 00:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6406E6E3E9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 00:08:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 54C77721A2; Fri,  5 Jul 2019 00:08:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109524] "Invalid glsl version in shading_language_version()"
 when trying to run directX games using wine
Date: Fri, 05 Jul 2019 00:08:48 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/R100
X-Bugzilla-Version: 18.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_file_loc
Message-ID: <bug-109524-502-7Rh6RjyOLN@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109524-502@http.bugs.freedesktop.org/>
References: <bug-109524-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0935668953=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0935668953==
Content-Type: multipart/alternative; boundary="15622853282.1DFEa.4650"
Content-Transfer-Encoding: 7bit


--15622853282.1DFEa.4650
Date: Fri, 5 Jul 2019 00:08:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109524

Ilia Mirkin <imirkin@alum.mit.edu> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                URL|http://www.onedollarwebhost |
                   |ings.com/rs-99-web-hosting- |
                   |domain-godaddy-india.html   |

--- Comment #9 from Ilia Mirkin <imirkin@alum.mit.edu> ---
Note that the following patch makes the t2k thing that was attached work fi=
ne.
However I need to check with Ian as to what's up.

diff --git a/src/mesa/main/extensions_table.h
b/src/mesa/main/extensions_table.h
index 332a75e6c73..ec376e497df 100644
--- a/src/mesa/main/extensions_table.h
+++ b/src/mesa/main/extensions_table.h
@@ -135,7 +135,7 @@ EXT(ARB_shader_subroutine                   , dummy_true
 EXT(ARB_shader_texture_image_samples        , ARB_shader_texture_image_sam=
ples
      , GLL, GLC,  x ,  x , 2014)
 EXT(ARB_shader_texture_lod                  , ARB_shader_texture_lod=20=20=
=20=20=20=20=20=20=20=20
      , GLL, GLC,  x ,  x , 2009)
 EXT(ARB_shader_viewport_layer_array         , ARB_shader_viewport_layer_ar=
ray=20
      , GLL, GLC,  x ,  x , 2015)
-EXT(ARB_shading_language_100                , dummy_true=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
      , GLL,  x ,  x ,  x , 2003)
+EXT(ARB_shading_language_100                , dummy_true=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
      , 15,  x ,  x ,  x , 2003)
 EXT(ARB_shading_language_420pack            , ARB_shading_language_420pack=
=20=20=20=20
      , GLL, GLC,  x ,  x , 2011)
 EXT(ARB_shading_language_packing            , ARB_shading_language_packing=
=20=20=20=20
      , GLL, GLC,  x ,  x , 2011)
 EXT(ARB_shadow                              , ARB_shadow=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
      , GLL,  x ,  x ,  x , 2001)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15622853282.1DFEa.4650
Date: Fri, 5 Jul 2019 00:08:48 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:imirkin&#=
64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <s=
pan class=3D"fn">Ilia Mirkin</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - &quot;Invalid glsl version in shading_language_version()&=
quot; when trying to run directX games using wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109524">bug 10952=
4</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">URL</td>
           <td>http://www.onedollarwebhostings.com/rs-99-web-hosting-domain=
-godaddy-india.html
           </td>
           <td>
               &nbsp;
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - &quot;Invalid glsl version in shading_language_version()&=
quot; when trying to run directX games using wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109524#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - &quot;Invalid glsl version in shading_language_version()&=
quot; when trying to run directX games using wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109524">bug 10952=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Note that the following patch makes the t2k thing that was att=
ached work fine.
However I need to check with Ian as to what's up.

diff --git a/src/mesa/main/extensions_table.h
b/src/mesa/main/extensions_table.h
index 332a75e6c73..ec376e497df 100644
--- a/src/mesa/main/extensions_table.h
+++ b/src/mesa/main/extensions_table.h
&#64;&#64; -135,7 +135,7 &#64;&#64; EXT(ARB_shader_subroutine              =
     , dummy_true
 EXT(ARB_shader_texture_image_samples        , ARB_shader_texture_image_sam=
ples
      , GLL, GLC,  x ,  x , 2014)
 EXT(ARB_shader_texture_lod                  , ARB_shader_texture_lod=20=20=
=20=20=20=20=20=20=20=20
      , GLL, GLC,  x ,  x , 2009)
 EXT(ARB_shader_viewport_layer_array         , ARB_shader_viewport_layer_ar=
ray=20
      , GLL, GLC,  x ,  x , 2015)
-EXT(ARB_shading_language_100                , dummy_true=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
      , GLL,  x ,  x ,  x , 2003)
+EXT(ARB_shading_language_100                , dummy_true=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
      , 15,  x ,  x ,  x , 2003)
 EXT(ARB_shading_language_420pack            , ARB_shading_language_420pack=
=20=20=20=20
      , GLL, GLC,  x ,  x , 2011)
 EXT(ARB_shading_language_packing            , ARB_shading_language_packing=
=20=20=20=20
      , GLL, GLC,  x ,  x , 2011)
 EXT(ARB_shadow                              , ARB_shadow=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
      , GLL,  x ,  x ,  x , 2001)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15622853282.1DFEa.4650--

--===============0935668953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0935668953==--
