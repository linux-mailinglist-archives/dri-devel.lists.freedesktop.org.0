Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 683982DB458
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 20:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC96D89C99;
	Tue, 15 Dec 2020 19:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FFD89C99
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 19:13:15 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b73so22207100edf.13
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 11:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cPyfcBydUJHcW1bt7kxWbC3iJpyjcS3VnUgf/MikUsE=;
 b=N95ViVQSl1retwpulH4UBp0i63LJRsjIgOraGhjMZsN/9QBiSF0IhkaCiWIdB7uojw
 dXVoan3O9VCY/jBq7csSBw+I8TelPHVVeSdNSX7ZVBXS9MFgg5FDaRSrhGksznticFrq
 AlqXQv+4Q0JY+jvp8+SYPWN3jNA99hHiBa44PRi+gsXd1196Tsr5VeQB+n1taKXqO58S
 nFFgEY60jauiSRhs102mImoy0icYwKuj2M+CU0mN8dhBeLPrZBzvT34O+6/LpuGu7pOX
 KljRvWSGkMbZONNf8nzp/XQIE1dBQ6aCydrz6DoiS19nxQx9xDpX/zY0uUmh7QXMH3WB
 8kJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cPyfcBydUJHcW1bt7kxWbC3iJpyjcS3VnUgf/MikUsE=;
 b=Psj4N9+6myCNlGJnpx13wEnMfDZc7bwHpXb/UwnZlAU6jWpn2fX5Vw+i+BDxR3oI+4
 8xhvSoZwxQXqtDhp0NPaomOSLL3aTU1h8m1UDOxTmBXy5kyMhUwKadr6Q4apkKHoCvJw
 MmlVJD6PSXSB67ZPmbzAdGqlTwvlrn8WpCYqXGOJczZb02zZ4ej1vJF0RriOAqXv3Tci
 DO5Hr3EMHaB5x/DScaB5Fx3v/uFPRZExGERFN0O34XQp4oD9T90FDwrrS45/SpZ1k/IP
 GDGvxF8erVwt/3GoFm5UyVnRmUxtNmjph3u/XQkQGp7SVUqJc6FyM0+jh7+SLpcDqb2C
 q4VA==
X-Gm-Message-State: AOAM53305o2lM7mJOSr3OPwvqLxIEa8X+mum0E1EXQRG2sUdX0Xk/l/U
 P9+Xsvlp47+RmAnVqXn1tIc08NKpAs9ntXRqhsakFZLhXQGSWj0F
X-Google-Smtp-Source: ABdhPJx3OtcJ0dAKewk+ZhhWSzJui99+0t9OV+ykofL+gTpXjZv1I9m02VTpX6LcPK/3paj6IMSJlBCN2no0Q70qR4k=
X-Received: by 2002:a05:6402:46:: with SMTP id
 f6mr31155868edu.163.1608059593530; 
 Tue, 15 Dec 2020 11:13:13 -0800 (PST)
MIME-Version: 1.0
References: <202012151818.lGhtGzd3-lkp@intel.com>
In-Reply-To: <202012151818.lGhtGzd3-lkp@intel.com>
From: Mauro Rossi <issor.oruam@gmail.com>
Date: Tue, 15 Dec 2020 20:13:51 +0100
Message-ID: <CAEQFVGYAZLJd3b=P3j28s7gmzbXuPX4uGtLR2du5e95-N05yLA@mail.gmail.com>
Subject: Re: [radeon-alex:amd-20.45 1953/2427]
 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_mgr.c:83:5:
 warning: no previous prototype for function 'dce60_get_dp_ref_freq_khz'
To: kernel test robot <lkp@intel.com>, Alex Deucher <alexander.deucher@amd.com>
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
Cc: clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Yang Xiong <Yang.Xiong@amd.com>
Content-Type: multipart/mixed; boundary="===============2067497088=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2067497088==
Content-Type: multipart/alternative; boundary="000000000000d99ff505b6858cb0"

--000000000000d99ff505b6858cb0
Content-Type: text/plain; charset="UTF-8"

Hello,
the mentioned branch requires the following commit, but it is already
applied in 5.10 released kernel,
so I really do not know what next step here.

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=8c4e4fd607b17973e54a7e9cc4c275b12ab7308e

Mauro

On Tue, Dec 15, 2020 at 11:24 AM kernel test robot <lkp@intel.com> wrote:

> tree:   git://people.freedesktop.org/~agd5f/linux.git amd-20.45
> head:   a3950d94b046fb206e58fd3ec717f071c0203ba3
> commit: e809646e73921328d66a2fbfddf067b9cdb30998 [1953/2427]
> drm/amd/display: enable SI support in the Kconfig (v2)
> config: x86_64-randconfig-a001-20201214 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project
> a29ecca7819a6ed4250d3689b12b1f664bb790d7)
> reproduce (this is a W=1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git remote add radeon-alex git://
> people.freedesktop.org/~agd5f/linux.git
>         git fetch --no-tags radeon-alex amd-20.45
>         git checkout e809646e73921328d66a2fbfddf067b9cdb30998
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross
> ARCH=x86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >>
> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_mgr.c:83:5:
> warning: no previous prototype for function 'dce60_get_dp_ref_freq_khz'
> [-Wmissing-prototypes]
>    int dce60_get_dp_ref_freq_khz(struct clk_mgr *clk_mgr_base)
>        ^
>
>  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_mgr.c:83:1:
> note: declare 'static' if the function is not intended to be used outside
> of this translation unit
>    int dce60_get_dp_ref_freq_khz(struct clk_mgr *clk_mgr_base)
>    ^
>    static
>    1 warning generated.
>
> vim +/dce60_get_dp_ref_freq_khz +83
> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_mgr.c
>
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   82
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11  @83  int
> dce60_get_dp_ref_freq_khz(struct clk_mgr *clk_mgr_base)
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   84  {
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   85     struct clk_mgr_internal
> *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   86     int dprefclk_wdivider;
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   87     int dp_ref_clk_khz;
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   88     int target_div;
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   89
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   90     /* DCE6 has no
> DPREFCLK_CNTL to read DP Reference Clock source */
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   91
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   92     /* Read the
> mmDENTIST_DISPCLK_CNTL to get the currently
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   93      * programmed DID
> DENTIST_DPREFCLK_WDIVIDER*/
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   94
>  REG_GET(DENTIST_DISPCLK_CNTL, DENTIST_DPREFCLK_WDIVIDER,
> &dprefclk_wdivider);
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   95
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   96     /* Convert
> DENTIST_DPREFCLK_WDIVIDERto actual divider*/
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   97     target_div =
> dentist_get_divider_from_did(dprefclk_wdivider);
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   98
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11   99     /* Calculate the current
> DFS clock, in kHz.*/
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11  100     dp_ref_clk_khz =
> (DENTIST_DIVIDER_RANGE_SCALE_FACTOR
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11  101             *
> clk_mgr->base.dentist_vco_freq_khz) / target_div;
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11  102
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11  103     return
> dce_adjust_dp_ref_freq_for_ss(clk_mgr, dp_ref_clk_khz);
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11  104  }
> 2428ad5c6ece1a6 Mauro Rossi 2020-07-11  105
>
> :::::: The code at line 83 was first introduced by commit
> :::::: 2428ad5c6ece1a6861278c01c5e71c8ea258f3d9 drm/amd/display:
> dc/clk_mgr: add support for SI parts (v2)
>
> :::::: TO: Mauro Rossi <issor.oruam@gmail.com>
> :::::: CC: Yang Xiong <Yang.Xiong@amd.com>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>

--000000000000d99ff505b6858cb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello,<div>the mentioned branch requires =
the following commit, but it is already applied in 5.10 released kernel,</d=
iv><div>so I really do not know what next step here.</div><div><br></div><d=
iv><a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.=
git/commit/?id=3D8c4e4fd607b17973e54a7e9cc4c275b12ab7308e">https://git.kern=
el.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3D8c4e4fd607b17=
973e54a7e9cc4c275b12ab7308e</a><br></div><div><br></div><div>Mauro</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Dec 15, 2020 at 11:24 AM kernel test robot &lt;<a href=3D"mailto:lkp@i=
ntel.com">lkp@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">tree:=C2=A0 =C2=A0git://<a href=3D"http://people.fre=
edesktop.org/~agd5f/linux.git" rel=3D"noreferrer" target=3D"_blank">people.=
freedesktop.org/~agd5f/linux.git</a> amd-20.45<br>
head:=C2=A0 =C2=A0a3950d94b046fb206e58fd3ec717f071c0203ba3<br>
commit: e809646e73921328d66a2fbfddf067b9cdb30998 [1953/2427] drm/amd/displa=
y: enable SI support in the Kconfig (v2)<br>
config: x86_64-randconfig-a001-20201214 (attached as .config)<br>
compiler: clang version 12.0.0 (<a href=3D"https://github.com/llvm/llvm-pro=
ject" rel=3D"noreferrer" target=3D"_blank">https://github.com/llvm/llvm-pro=
ject</a> a29ecca7819a6ed4250d3689b12b1f664bb790d7)<br>
reproduce (this is a W=3D1 build):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wget <a href=3D"https://raw.githubusercontent.c=
om/intel/lkp-tests/master/sbin/make.cross" rel=3D"noreferrer" target=3D"_bl=
ank">https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cro=
ss</a> -O ~/bin/make.cross<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod +x ~/bin/make.cross<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # install x86_64 cross compiling tool for clang=
 build<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # apt-get install binutils-x86-64-linux-gnu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git remote add radeon-alex git://<a href=3D"htt=
p://people.freedesktop.org/~agd5f/linux.git" rel=3D"noreferrer" target=3D"_=
blank">people.freedesktop.org/~agd5f/linux.git</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git fetch --no-tags radeon-alex amd-20.45<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git checkout e809646e73921328d66a2fbfddf067b9cd=
b30998<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # save the attached .config to linux build tree=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dc=
lang make.cross ARCH=3Dx86_64 <br>
<br>
If you fix the issue, kindly add following tag as appropriate<br>
Reported-by: kernel test robot &lt;<a href=3D"mailto:lkp@intel.com" target=
=3D"_blank">lkp@intel.com</a>&gt;<br>
<br>
All warnings (new ones prefixed by &gt;&gt;):<br>
<br>
&gt;&gt; drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_m=
gr.c:83:5: warning: no previous prototype for function &#39;dce60_get_dp_re=
f_freq_khz&#39; [-Wmissing-prototypes]<br>
=C2=A0 =C2=A0int dce60_get_dp_ref_freq_khz(struct clk_mgr *clk_mgr_base)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
=C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_c=
lk_mgr.c:83:1: note: declare &#39;static&#39; if the function is not intend=
ed to be used outside of this translation unit<br>
=C2=A0 =C2=A0int dce60_get_dp_ref_freq_khz(struct clk_mgr *clk_mgr_base)<br=
>
=C2=A0 =C2=A0^<br>
=C2=A0 =C2=A0static <br>
=C2=A0 =C2=A01 warning generated.<br>
<br>
vim +/dce60_get_dp_ref_freq_khz +83 drivers/gpu/drm/amd/amdgpu/../display/d=
c/clk_mgr/dce60/dce60_clk_mgr.c<br>
<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A082=C2=A0 <br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 @83=C2=A0 int dce60_get_dp_ref=
_freq_khz(struct clk_mgr *clk_mgr_base)<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A084=C2=A0 {<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A085=C2=A0 =C2=A0 =C2=A0st=
ruct clk_mgr_internal *clk_mgr =3D TO_CLK_MGR_INTERNAL(clk_mgr_base);<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A086=C2=A0 =C2=A0 =C2=A0in=
t dprefclk_wdivider;<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A087=C2=A0 =C2=A0 =C2=A0in=
t dp_ref_clk_khz;<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A088=C2=A0 =C2=A0 =C2=A0in=
t target_div;<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A089=C2=A0 <br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A090=C2=A0 =C2=A0 =C2=A0/*=
 DCE6 has no DPREFCLK_CNTL to read DP Reference Clock source */<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A091=C2=A0 <br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A092=C2=A0 =C2=A0 =C2=A0/*=
 Read the mmDENTIST_DISPCLK_CNTL to get the currently<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A093=C2=A0 =C2=A0 =C2=A0 *=
 programmed DID DENTIST_DPREFCLK_WDIVIDER*/<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A094=C2=A0 =C2=A0 =C2=A0RE=
G_GET(DENTIST_DISPCLK_CNTL, DENTIST_DPREFCLK_WDIVIDER, &amp;dprefclk_wdivid=
er);<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A095=C2=A0 <br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A096=C2=A0 =C2=A0 =C2=A0/*=
 Convert DENTIST_DPREFCLK_WDIVIDERto actual divider*/<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A097=C2=A0 =C2=A0 =C2=A0ta=
rget_div =3D dentist_get_divider_from_did(dprefclk_wdivider);<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A098=C2=A0 <br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 =C2=A099=C2=A0 =C2=A0 =C2=A0/*=
 Calculate the current DFS clock, in kHz.*/<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 100=C2=A0 =C2=A0 =C2=A0dp_ref_=
clk_khz =3D (DENTIST_DIVIDER_RANGE_SCALE_FACTOR<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 101=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0* clk_mgr-&gt;base.dentist_vco_freq_khz) / target_div;=
<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 102=C2=A0 <br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 103=C2=A0 =C2=A0 =C2=A0return =
dce_adjust_dp_ref_freq_for_ss(clk_mgr, dp_ref_clk_khz);<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 104=C2=A0 }<br>
2428ad5c6ece1a6 Mauro Rossi 2020-07-11=C2=A0 105=C2=A0 <br>
<br>
:::::: The code at line 83 was first introduced by commit<br>
:::::: 2428ad5c6ece1a6861278c01c5e71c8ea258f3d9 drm/amd/display: dc/clk_mgr=
: add support for SI parts (v2)<br>
<br>
:::::: TO: Mauro Rossi &lt;<a href=3D"mailto:issor.oruam@gmail.com" target=
=3D"_blank">issor.oruam@gmail.com</a>&gt;<br>
:::::: CC: Yang Xiong &lt;<a href=3D"mailto:Yang.Xiong@amd.com" target=3D"_=
blank">Yang.Xiong@amd.com</a>&gt;<br>
<br>
---<br>
0-DAY CI Kernel Test Service, Intel Corporation<br>
<a href=3D"https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org" re=
l=3D"noreferrer" target=3D"_blank">https://lists.01.org/hyperkitty/list/kbu=
ild-all@lists.01.org</a><br>
</blockquote></div></div>

--000000000000d99ff505b6858cb0--

--===============2067497088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2067497088==--
