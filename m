Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5DD25820D
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 21:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED0C6E42E;
	Mon, 31 Aug 2020 19:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EFB6E42A;
 Mon, 31 Aug 2020 19:48:27 +0000 (UTC)
IronPort-SDR: Up1nNPhax3ZA9vXX3riRFq6AT/imXIMxEdgHSDA8+Nud9sAIx0MM43m7qMyxeXSaVAcQlgDepG
 0UDo61MXoS6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="221279010"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="221279010"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 12:48:25 -0700
IronPort-SDR: gML8hXmqtfjjuG40dmw03exE7XYZXpDxuL5Um8aFGI0ZxnjaK5qgiAog5/r59mPovT8zPll07b
 ASzOLImW+inQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="338320232"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 31 Aug 2020 12:48:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 31 Aug 2020 22:48:20 +0300
Date: Mon, 31 Aug 2020 22:48:20 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kai Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] drm/i915/lspcon: Limits to 8 bpc for RGB/YCbCr444
Message-ID: <20200831194820.GB6112@intel.com>
References: <20200826052143.17607-1-kai.heng.feng@canonical.com>
 <20200826162458.GP6112@intel.com>
 <6D40F1E0-AFF6-4D38-BB9B-C52B43F83266@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6D40F1E0-AFF6-4D38-BB9B-C52B43F83266@canonical.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 27, 2020 at 01:04:54PM +0800, Kai Heng Feng wrote:
> Hi Ville,
> =

> > On Aug 27, 2020, at 12:24 AM, Ville Syrj=E4l=E4 <ville.syrjala@linux.in=
tel.com> wrote:
> > =

> > On Wed, Aug 26, 2020 at 01:21:15PM +0800, Kai-Heng Feng wrote:
> >> LSPCON only supports 8 bpc for RGB/YCbCr444.
> >> =

> >> Set the correct bpp otherwise it renders blank screen.
> > =

> > Hmm. Does =

> > git://github.com/vsyrjala/linux.git dp_downstream_ports_5
> > work?
> > =

> > Actually better make that dp_downstream_ports_5^^^^^^^^^^^ aka.
> > 54d846ce62a2 ("drm/i915: Do YCbCr 444->420 conversion via DP protocol
> > converters") to avoid the experiments and hacks I have sitting on top.
> =

> Can you please rebase it to mainline master or drm-tip?

git://github.com/vsyrjala/linux.git dp_downstream_ports_6

I threw out the hacks/experimental stuff.

> =

> I am getting errors on the branch:
> =

>   DESCEND  objtool
>   CALL    scripts/atomic/check-atomics.sh
>   CALL    scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
>   Building modules, stage 2.
>   MODPOST 166 modules
>   LD      arch/x86/boot/compressed/vmlinux
> ld: arch/x86/boot/compressed/pgtable_64.o:(.bss+0x0): multiple definition=
 of `__force_order'; arch/x86/boot/compressed/kaslr_64.o:(.bss+0x0): first =
defined here
> ld: arch/x86/boot/compressed/head_64.o: warning: relocation in read-only =
section `.head.text'
> ld: warning: creating DT_TEXTREL in a PIE
> make[2]: *** [arch/x86/boot/compressed/Makefile:119: arch/x86/boot/compre=
ssed/vmlinux] Error 1
> make[1]: *** [arch/x86/boot/Makefile:113: arch/x86/boot/compressed/vmlinu=
x] Error 2
> make: *** [arch/x86/Makefile:284: bzImage] Error 2
> make: *** Waiting for unfinished jobs....
> =

> Kai-Heng
> =

> > =

> >> =

> >> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2195
> >> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> >> ---
> >> drivers/gpu/drm/i915/display/intel_lspcon.c | 3 ++-
> >> 1 file changed, 2 insertions(+), 1 deletion(-)
> >> =

> >> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu=
/drm/i915/display/intel_lspcon.c
> >> index b781bf469644..c7a44fcaade8 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> >> @@ -196,7 +196,8 @@ void lspcon_ycbcr420_config(struct drm_connector *=
connector,
> >> 		crtc_state->port_clock /=3D 2;
> >> 		crtc_state->output_format =3D INTEL_OUTPUT_FORMAT_YCBCR444;
> >> 		crtc_state->lspcon_downsampling =3D true;
> >> -	}
> >> +	} else
> >> +		crtc_state->pipe_bpp =3D 24;
> >> }
> >> =

> >> static bool lspcon_probe(struct intel_lspcon *lspcon)
> >> -- =

> >> 2.17.1
> > =

> > -- =

> > Ville Syrj=E4l=E4
> > Intel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
