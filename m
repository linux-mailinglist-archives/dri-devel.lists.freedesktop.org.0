Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ED6497805
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 05:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E1A10E125;
	Mon, 24 Jan 2022 04:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic302-1.consmr.mail.bf2.yahoo.com
 (sonic302-1.consmr.mail.bf2.yahoo.com [74.6.135.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE6410E125
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 04:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1642998088; bh=2h9o6xuXk6ls5OrPeMzHsPEvGrUS6c9kMMhclma3j+w=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=ldJb8ty4PcndgrrAx5ZuBM/7Pzu66Ymw4UYP8Pss1wLwk4CXx2lP/Od3OUjEdPQauPDHw4RQvzEFemFgH5MczjpCNoDrmHkFwQES9vmZjPoilE1+hNO4XmM6MYofMv+oHFdXQtu4INetK6N5cJ3M98BkH0QPP6E2w2YRBipN7yHSIqLe5fBGiPNXW/JyOPB7/tZdsDB9xrPct347C2r5I8DTfbo3A0OXoxKnv0uyXh+yt4oXDqF+A3j39dBr941+e1irYVMqkxt+xcT/U/xbjvozf55W2k9RlIWp9rfca6Al6jgav8hOqrC2476P6YlejeYmwJnRaHHCxvLLAtm22Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1642998088; bh=Pigjp8VLPkkLGvJiTQCYNCvObXaDRAziaonfI0pU5+M=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=I1pdHN7DLFMABgfVDtMs+BeLqM0FjaXz5j5MEbrR1uUA/K2fvrzE+aIY7vmoIatG1BSlmvSJAwnrULpxYT+FdVjvnaxIILKYd7pON5+/CpqS+NPUfnVVdzCgux4ldpcoLdEyOXI4TfV9Z2G4ksKxJQWm834AgcKXGBK/J6QZUW5RaXZoxsVwvPlNPi/N6Fzcdfmox/ifOfp0Wxn5AG0jGJMXi7YT5QQR+wyMRFFmWLGk21HdrfuPmLtFz7nvdKvtskWwPwwXdHktXaZYKcZ3vzbvhQYWNhUZksf7HuN7Hr2WAjgAR9C/ZglTR6iijH5nx8QIb0LqqsRY8dgRNURL0g==
X-YMail-OSG: kwdREWwVM1kUaz2GQQDGZCED2kDw4Be6UgP6U18hL6DZa8Bwn6PXVxkioXN6KOo
 GsTxEtqoyoMyGtxNRNuMNWToQlX303A9rb6hDhfOXSSBG.LftyuWBZuZa9tWAhjGprNOmZSgEG0E
 YjxpZWS7HRKptfXGesJRghwrlFJYwr8MsP8crvSJNq1VhvWGj28MexZLtQyJbWu2aiAH6poJgXBx
 wka7wq.dYvV9kQIO0I5mLOj7yXucEPaTxZ8ampxuhSo_XpxlTqUCIvEsoQltIIPpz4Abw6uJzWBp
 KKE2XWqE4.7aEQt6XUipaUpBJLZsVSHDhlBm73hSk2IY927wfrXelQE1qXhDMDSesycjReKuKIBB
 INOcMAXzTjFbwwTwzzFtrlmZZGtOb7bWwqU.dnAET_z8zf.3.I22yo3HPRgMMZB1eHLqgXCahPmm
 874ZGWBDFzt7cgXrKyEvD6N9lbCcS9jbg8cz8YUl4A2LFLeE497AY6oa_kZPTZL4QD.mgeCwCfJZ
 tdODphLPpBKTDZbjaZKeWVQSnxLXsjWT16sdVvkJ077U.zYEDCiQp0iEeiKfD_lNGjU1j8TK.VEF
 sJOD0UwEoGVnZZNgeWkLyMFjrD6AN2gqFuxLiC5J6wtCTA8q0oR_itqW9h3I3.p_P7NpnW03jH6t
 QwP8Z7RbGBYaaESWwQNzr_beyrh2.ELmnk26.zWsKM5i4GpppipsuF9XwzgJmTTpppDT0Nat6R4k
 adx4rpQ26kqALyLaxRnkHtV5WXMaKAOHtr_4FU_vD6RXa1.bH_4DQQWNnpaRhMH9QlhynKGU6VPF
 R25tfW2JO5s4oOa8IG8GDEda227iI.T.bR0JlqczeRnbWAcThJfkF3sMASQUXNOXoS2iNHvNWiae
 .PmdQ.BhNcMfZ6onuaAQHYT85cJFQg9eNOBmRgwgiW1L5BuDf73s3Ak7vjwp2KbqDkGWLQCSEKxN
 fDoz2d56gbegIZPsu5bXi6yF7QDqfCRl0JthmNHYg6TfE9be71uE8HL.YX0xRhbzXI2pbH4mPHUC
 E9gLFq6Ty9cgF1oXfhHXa.WA_erPqZYq4tsVHKTFr8QwSZWsAoiiOCiuXau5hZaSHv9Op.R1AyO8
 D.nNRBW34M3tP5x2nXACjQuUdyRWzz.JCi.a53y.mky4nfbIHqKsD1kMcmPSkEfPJcgfs_zByeNZ
 lWE_3Z6BodsHdvSkvpB4VBZdftdELfQcMrGif5Q2CdLZK_5C5kBGKLYW.n4ZYJofUGOPW9tLFSPF
 himtIYMrHtCeKdUsKZpgaLcsokFAqqMK1rUQCLsz6FP5lioG1ylA7qe5FQz6HATItSPQ6ObjX35h
 ROoz4zsUGt7ocI_h8HDmD.6ILL3UL55FoZITY08_zoAKB7Cw.rdwFoXVYptz1rd1Hm1_8_ka4uP3
 y2X42j6etHEDaP6ggGYds.HFXjuoK.iEbMp.BUN.6IMmJVx7sWaeptW5GCakUuCCFiDof3iupbvg
 9B5r8ZMXBQBUT66UCHGwjDvkJmriq5LqyM02x.3uBUxeRx17RBzEf_FswDqaGwBFPCgQ9W7wRYUX
 pKnJ4tJUyuiUU1mvZLpKo7iIGEZs4t5qCTins3b15gs2s.IAlc29DPo3o9wrYj3OJQG8DIkIUDp4
 mPmrHjnP0CnN.R10_4QuIzOj_Cb4WpQx.RIUadQ0.SqjEExtqN_x34jgbjwwzuIvXTuP8jFnhaJ1
 9iezomGb2iN0ZvP_pky1nQB4zdPVcygjQcl7QRLLAeezYxHg6n2jvjHXBPOU0ksKf.ASRgHPVOnm
 1peJUFUDrpgKBNR8xWSq9S8xjS13B.dFVA7NzrYmDueM5RIRXvPwFDK5QtUZ31Xa1wq82dZLdcn3
 UIBUNyL.MVuC41DZ.jmfTyPhqjx5hZxARSQnDVJxKvFGa3Rif0YN6scvrCCHXK8tGqtWpq8ltg4u
 NOQrRE1DrKGhg_jRwle4LJocnl7zOarkmcuDL9aXCrchr.GuwvE75Z1_1hAKg6j5g8HExcWgEAMk
 T482I0izyq7P4fsfHXwGMm5Qk7.18XEcnsJl5KGMxswIe7TfgqnurzmY4CnqKi5UGspDm7XHweAM
 wKzNITbe990H38GnjaUmXAKQavu7Mu2yJyOUoM5qVY.DcLSZkPNW0k88rO81itcaAmIauB5s9cOj
 EDYuxDSx_YchHU6N_MV7zQhou41shrOv6VUUSLuHXPD7CCUWG.zoTUSRdfqGRMF1WveFt2mgr6mq
 6g74UXFryBo8B2wjC20OxKuglNHA-
X-Sonic-MF: <chazste@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.bf2.yahoo.com with HTTP; Mon, 24 Jan 2022 04:21:28 +0000
Date: Mon, 24 Jan 2022 04:21:24 +0000 (UTC)
From: Charles Stevens <chazste@yahoo.com>
To: Adam Ford <aford173@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <792976696.783204.1642998084136@mail.yahoo.com>
In-Reply-To: <Ye1v6WkLsUBxL9fy@pendragon.ideasonboard.com>
References: <FE3831D8-A33F-470B-AD55-6005786139AF.ref@yahoo.com>
 <FE3831D8-A33F-470B-AD55-6005786139AF@yahoo.com>
 <CAHCN7xJvDP7o__42Rm7n-KNhoGa4MTP2iuty+x_k616ANkcu+Q@mail.gmail.com>
 <Ye1v6WkLsUBxL9fy@pendragon.ideasonboard.com>
Subject: Re: Renesas rcar-du and DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_783203_211381917.1642998084133"
X-Mailer: WebService/1.1.19615 YMailNorrin
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
Cc: "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

------=_Part_783203_211381917.1642998084133
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 On Sunday, January 23, 2022, 09:10:53 AM CST, Laurent Pinchart <laurent.pi=
nchart@ideasonboard.com> wrote:
=20
  > Hello,>=C2=A0> Thanks for CC me Adam.>=C2=A0> On Fri, Jan 21, 2022 at 1=
1:24:09AM -0600, Adam Ford wrote:> > On Wed, Dec 29, 2021 at 10:19 PM Charl=
es Stevens wrote:> > >> > > Hi All,> > >> > > I am working on a platform ba=
sed on the Renesas RZ/G2 SoC family.> > > This chip uses the rcar-du driver=
 for the display. I would like to> > > submit a patch to address the fact t=
hat the driver does not> > > check/honor the flag DRM_BUS_FLAG_PIXDATA_DRIV=
E_POSEDGE. My issue is> > > that I would like to make as small a change to =
the driver as> > > possible, but the panel bus_flags don't seem to even mak=
e it to the> > > crtc driver. The crtc driver seems to use adjusted_mode to=
 set the> > > HSYNC and VSYNC polarity and as I said ignores the pixel cloc=
k> > > polarity leaving it at the default of driving on the falling edge.> =
> > In my investigations so far I have not figured out how to chase the> > =
> pointers from the CRTC to the bridge to the panel in order to be> > > abl=
e to look at bus_flags. My current approach also modifies the> > > encoder =
initialization to cache the needed panel and then find the> > > attached en=
coder during CRTC initialization to find the bus flags.> > > This seems lik=
e a lot of work and not something that would be> > > accepted as a patch. T=
he OMAP DSS seems to have problems accessing> > this flag as well. The TI d=
river goes so far as to document the> > current approach as a HACK and sugg=
est a fairly large change to the> > driver to address the problem. Am I mis=
sing something? Is there an> > easy way to get from a drm_crtc to a drm_pan=
el that is in the same> > pipeline?>=C2=A0> This is actually something I've=
 experimented with before. I wrote> patches, but never got a chance to post=
 them. I've pushed them to> git://linuxtv.org/pinchartl/media.git drm/du/sy=
ncpol if you want to have> a look.>=C2=A0OK. I've looked over this patch an=
d agree that it should work for my use case=C2=A0too. Thank you.
> However, there's one issue with this approach: it's not correct :-) The> =
CRTC shouldn't be configured based on the polarity of signals at the end> o=
f the pipeline, it needs to be configured based on the polarities> expected=
 by the next bridge in the chain. That may depend on the next> bridge, whic=
h may depend on the next bridge, and so on. The information> should thus be=
 propagated from the panel towards the CRTC, one bridge at> a time, the sam=
e way that we propagate formats with the bridge> .atomic_get_input_bus_fmts=
() and .atomic_get_output_bus_fmts()> operations. There's thus quite a bit =
of work required to handle all this.>=C2=A0Thank you for the description he=
re. I can agree that this aproach seems a lotbetter way. Propogating the fl=
ags though the bridges and not requiring drmobjects to know about other obj=
ects not directly connected makes a lot of sense.
So that leaves me with the question, what can I do to help move this along.=
 I=C2=A0would like to see ESCR_DCLKOINV get written in the rcar-du driver i=
n mainline=C2=A0Linux sometime in the near future :)=C2=A0
> > > Any pointers would be greatly appreciated!> >> > +=C2=A0 Laurent, Kie=
ran> >> > Charles,> >> > I added Laurent and Kieran because they appear as =
the maintainers for> the rcar-du driver.>=C2=A0>=C2=A0> --> Regards,>=C2=A0=
> Laurent Pinchart
Regards,=C2=A0 =C2=A0 -charles =20
------=_Part_783203_211381917.1642998084133
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp9c280aa6yahoo-style-wrap" style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 1=
3px;"><div></div>
        <div><span style=3D"color: rgb(38, 40, 42);">On Sunday, January 23,=
 2022, 09:10:53 AM CST, Laurent Pinchart &lt;laurent.pinchart@ideasonboard.=
com&gt; wrote:</span><br></div></div><div id=3D"ydp7c9446abyahoo_quoted_374=
3177133" class=3D"ydp7c9446abyahoo_quoted"><div style=3D"font-family:'Helve=
tica Neue', Helvetica, Arial, sans-serif;font-size:13px;color:#26282a;">
                <div><br></div>
                <div dir=3D"ltr" data-setdir=3D"false"> <div><div>&gt; Hell=
o,</div><div>&gt;&nbsp;</div><div>&gt; Thanks for CC me Adam.</div><div>&gt=
;&nbsp;</div><div>&gt; On Fri, Jan 21, 2022 at 11:24:09AM -0600, Adam Ford =
wrote:</div><div>&gt; &gt; On Wed, Dec 29, 2021 at 10:19 PM Charles Stevens=
 wrote:</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; Hi All,</div><div=
>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; I am working on a platform based o=
n the Renesas RZ/G2 SoC family.</div><div>&gt; &gt; &gt; This chip uses the=
 rcar-du driver for the display. I would like to</div><div>&gt; &gt; &gt; s=
ubmit a patch to address the fact that the driver does not</div><div>&gt; &=
gt; &gt; check/honor the flag DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE. My issue =
is</div><div>&gt; &gt; &gt; that I would like to make as small a change to =
the driver as</div><div>&gt; &gt; &gt; possible, but the panel bus_flags do=
n't seem to even make it to the</div><div>&gt; &gt; &gt; crtc driver. The c=
rtc driver seems to use adjusted_mode to set the</div><div>&gt; &gt; &gt; H=
SYNC and VSYNC polarity and as I said ignores the pixel clock</div><div>&gt=
; &gt; &gt; polarity leaving it at the default of driving on the falling ed=
ge.</div><div>&gt; &gt; &gt; In my investigations so far I have not figured=
 out how to chase the</div><div>&gt; &gt; &gt; pointers from the CRTC to th=
e bridge to the panel in order to be</div><div>&gt; &gt; &gt; able to look =
at bus_flags. My current approach also modifies the</div><div>&gt; &gt; &gt=
; encoder initialization to cache the needed panel and then find the</div><=
div>&gt; &gt; &gt; attached encoder during CRTC initialization to find the =
bus flags.</div><div>&gt; &gt; &gt; This seems like a lot of work and not s=
omething that would be</div><div>&gt; &gt; &gt; accepted as a patch. The OM=
AP DSS seems to have problems accessing</div><div>&gt; &gt; this flag as we=
ll. The TI driver goes so far as to document the</div><div>&gt; &gt; curren=
t approach as a HACK and suggest a fairly large change to the</div><div>&gt=
; &gt; driver to address the problem. Am I missing something? Is there an</=
div><div>&gt; &gt; easy way to get from a drm_crtc to a drm_panel that is i=
n the same</div><div>&gt; &gt; pipeline?</div><div>&gt;&nbsp;</div><div>&gt=
; This is actually something I've experimented with before. I wrote</div><d=
iv>&gt; patches, but never got a chance to post them. I've pushed them to</=
div><div>&gt; git://linuxtv.org/pinchartl/media.git drm/du/syncpol if you w=
ant to have</div><div>&gt; a look.</div><div>&gt;&nbsp;</div><div>OK. I've =
looked over this patch and agree that it should work for my use case&nbsp;<=
/div><div>too. Thank you.</div><div><br></div><div>&gt; However, there's on=
e issue with this approach: it's not correct :-) The</div><div>&gt; CRTC sh=
ouldn't be configured based on the polarity of signals at the end</div><div=
>&gt; of the pipeline, it needs to be configured based on the polarities</d=
iv><div>&gt; expected by the next bridge in the chain. That may depend on t=
he next</div><div>&gt; bridge, which may depend on the next bridge, and so =
on. The information</div><div>&gt; should thus be propagated from the panel=
 towards the CRTC, one bridge at</div><div>&gt; a time, the same way that w=
e propagate formats with the bridge</div><div>&gt; .atomic_get_input_bus_fm=
ts() and .atomic_get_output_bus_fmts()</div><div>&gt; operations. There's t=
hus quite a bit of work required to handle all this.</div><div>&gt;&nbsp;</=
div><div>Thank you for the description here. I can agree that this aproach =
seems a lot</div><div>better way. Propogating the flags though the bridges =
and not requiring drm</div><div>objects to know about other objects not dir=
ectly connected makes a lot of sense.</div><div><br></div><div>So that leav=
es me with the question, what can I do to help move this along. I&nbsp;</di=
v><div>would like to see ESCR_DCLKOINV get written in the rcar-du driver in=
 mainline&nbsp;</div><div>Linux sometime in the near future :)&nbsp;</div><=
div><br></div><div>&gt; &gt; &gt; Any pointers would be greatly appreciated=
!</div><div>&gt; &gt;</div><div>&gt; &gt; +&nbsp; Laurent, Kieran</div><div=
>&gt; &gt;</div><div>&gt; &gt; Charles,</div><div>&gt; &gt;</div><div>&gt; =
&gt; I added Laurent and Kieran because they appear as the maintainers for<=
/div><div>&gt; the rcar-du driver.</div><div>&gt;&nbsp;</div><div>&gt;&nbsp=
;</div><div>&gt; --</div><div>&gt; Regards,</div><div>&gt;&nbsp;</div><div>=
&gt; Laurent Pinchart</div></div><br><div class=3D"ydp7c9446abyqt5075624753=
" id=3D"ydp7c9446abyqtfd80687" dir=3D"ltr" data-setdir=3D"false">Regards,</=
div><div class=3D"ydp7c9446abyqt5075624753" id=3D"ydp7c9446abyqtfd80687" di=
r=3D"ltr" data-setdir=3D"false">&nbsp; &nbsp; -charles</div></div>
            </div>
        </div></body></html>
------=_Part_783203_211381917.1642998084133--
