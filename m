Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 127BE101065
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 01:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CA96E110;
	Tue, 19 Nov 2019 00:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADBB6E110
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 00:57:50 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Nov 2019 16:57:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,322,1569308400"; 
 d="gz'50?scan'50,208,50";a="204242811"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 18 Nov 2019 16:57:48 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iWrpz-000DPV-JW; Tue, 19 Nov 2019 08:57:47 +0800
Date: Tue, 19 Nov 2019 08:57:11 +0800
From: kbuild test robot <lkp@intel.com>
To: Mikita Lipski <mikita.lipski@amd.com>
Subject: [radeon-alex:amd-staging-drm-next 852/868]
 drivers/gpu/drm/drm_dsc.c:435:16: note: in expansion of macro 'max'
Message-ID: <201911190810.cb9chd8J%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="otj32ebelstom3kh"
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: David Francis <David.Francis@amd.com>, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org, Nikola Cornij <nikola.cornij@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--otj32ebelstom3kh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-staging-drm-next
head:   c749b504bf85eee2edc857c4549d83d34730113c
commit: 8d47a4e3262de5f749806245d087dc8aa5ae2253 [852/868] drm/dsc: Update drm_dsc to reflect native 4.2.0 DSC spec
config: riscv-defconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 8d47a4e3262de5f749806245d087dc8aa5ae2253
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=riscv 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_dsc.c:9:0:
   drivers/gpu/drm/drm_dsc.c: In function 'drm_dsc_compute_rc_parameters':
   include/linux/kernel.h:821:29: warning: comparison of distinct pointer types lacks a cast
      (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                                ^
   include/linux/kernel.h:835:4: note: in expansion of macro '__typecheck'
      (__typecheck(x, y) && __no_side_effects(x, y))
       ^~~~~~~~~~~
   include/linux/kernel.h:845:24: note: in expansion of macro '__safe_cmp'
     __builtin_choose_expr(__safe_cmp(x, y), \
                           ^~~~~~~~~~
   include/linux/kernel.h:861:19: note: in expansion of macro '__careful_cmp'
    #define max(x, y) __careful_cmp(x, y, >)
                      ^~~~~~~~~~~~~
>> drivers/gpu/drm/drm_dsc.c:435:16: note: in expansion of macro 'max'
      max_offset = max(max_offset,
                   ^~~
   include/linux/kernel.h:821:29: warning: comparison of distinct pointer types lacks a cast
      (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                                ^
   include/linux/kernel.h:835:4: note: in expansion of macro '__typecheck'
      (__typecheck(x, y) && __no_side_effects(x, y))
       ^~~~~~~~~~~
   include/linux/kernel.h:845:24: note: in expansion of macro '__safe_cmp'
     __builtin_choose_expr(__safe_cmp(x, y), \
                           ^~~~~~~~~~
   include/linux/kernel.h:861:19: note: in expansion of macro '__careful_cmp'
    #define max(x, y) __careful_cmp(x, y, >)
                      ^~~~~~~~~~~~~
   drivers/gpu/drm/drm_dsc.c:440:16: note: in expansion of macro 'max'
      max_offset = max(max_offset,
                   ^~~

vim +/max +435 drivers/gpu/drm/drm_dsc.c

   279	
   280	/**
   281	 * drm_dsc_compute_rc_parameters() - Write rate control
   282	 * parameters to the dsc configuration defined in
   283	 * &struct drm_dsc_config in accordance with the DSC 1.2
   284	 * specification. Some configuration fields must be present
   285	 * beforehand.
   286	 *
   287	 * @vdsc_cfg:
   288	 * DSC Configuration data partially filled by driver
   289	 */
   290	int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg)
   291	{
   292		unsigned long groups_per_line = 0;
   293		unsigned long groups_total = 0;
   294		unsigned long num_extra_mux_bits = 0;
   295		unsigned long slice_bits = 0;
   296		unsigned long hrd_delay = 0;
   297		unsigned long final_scale = 0;
   298		unsigned long rbs_min = 0;
   299		unsigned long max_offset = 0;
   300	
   301		if (vdsc_cfg->native_420 || vdsc_cfg->native_422) {
   302			/* Number of groups used to code each line of a slice */
   303			groups_per_line = DIV_ROUND_UP(vdsc_cfg->slice_width / 2,
   304						       DSC_RC_PIXELS_PER_GROUP);
   305	
   306			/* chunksize in Bytes */
   307			vdsc_cfg->slice_chunk_size = DIV_ROUND_UP(vdsc_cfg->slice_width / 2 *
   308								  vdsc_cfg->bits_per_pixel,
   309								  (8 * 16));
   310		} else {
   311			/* Number of groups used to code each line of a slice */
   312			groups_per_line = DIV_ROUND_UP(vdsc_cfg->slice_width,
   313						       DSC_RC_PIXELS_PER_GROUP);
   314	
   315			/* chunksize in Bytes */
   316			vdsc_cfg->slice_chunk_size = DIV_ROUND_UP(vdsc_cfg->slice_width *
   317								  vdsc_cfg->bits_per_pixel,
   318								  (8 * 16));
   319		}
   320	
   321		if (vdsc_cfg->convert_rgb)
   322			num_extra_mux_bits = 3 * (vdsc_cfg->mux_word_size +
   323						  (4 * vdsc_cfg->bits_per_component + 4)
   324						  - 2);
   325		else if (vdsc_cfg->native_422)
   326			num_extra_mux_bits = 4 * vdsc_cfg->mux_word_size +
   327				(4 * vdsc_cfg->bits_per_component + 4) +
   328				3 * (4 * vdsc_cfg->bits_per_component) - 2;
   329		else
   330			num_extra_mux_bits = 3 * vdsc_cfg->mux_word_size +
   331				(4 * vdsc_cfg->bits_per_component + 4) +
   332				2 * (4 * vdsc_cfg->bits_per_component) - 2;
   333		/* Number of bits in one Slice */
   334		slice_bits = 8 * vdsc_cfg->slice_chunk_size * vdsc_cfg->slice_height;
   335	
   336		while ((num_extra_mux_bits > 0) &&
   337		       ((slice_bits - num_extra_mux_bits) % vdsc_cfg->mux_word_size))
   338			num_extra_mux_bits--;
   339	
   340		if (groups_per_line < vdsc_cfg->initial_scale_value - 8)
   341			vdsc_cfg->initial_scale_value = groups_per_line + 8;
   342	
   343		/* scale_decrement_interval calculation according to DSC spec 1.11 */
   344		if (vdsc_cfg->initial_scale_value > 8)
   345			vdsc_cfg->scale_decrement_interval = groups_per_line /
   346				(vdsc_cfg->initial_scale_value - 8);
   347		else
   348			vdsc_cfg->scale_decrement_interval = DSC_SCALE_DECREMENT_INTERVAL_MAX;
   349	
   350		vdsc_cfg->final_offset = vdsc_cfg->rc_model_size -
   351			(vdsc_cfg->initial_xmit_delay *
   352			 vdsc_cfg->bits_per_pixel + 8) / 16 + num_extra_mux_bits;
   353	
   354		if (vdsc_cfg->final_offset >= vdsc_cfg->rc_model_size) {
   355			DRM_DEBUG_KMS("FinalOfs < RcModelSze for this InitialXmitDelay\n");
   356			return -ERANGE;
   357		}
   358	
   359		final_scale = (vdsc_cfg->rc_model_size * 8) /
   360			(vdsc_cfg->rc_model_size - vdsc_cfg->final_offset);
   361		if (vdsc_cfg->slice_height > 1)
   362			/*
   363			 * NflBpgOffset is 16 bit value with 11 fractional bits
   364			 * hence we multiply by 2^11 for preserving the
   365			 * fractional part
   366			 */
   367			vdsc_cfg->nfl_bpg_offset = DIV_ROUND_UP((vdsc_cfg->first_line_bpg_offset << 11),
   368								(vdsc_cfg->slice_height - 1));
   369		else
   370			vdsc_cfg->nfl_bpg_offset = 0;
   371	
   372		/* 2^16 - 1 */
   373		if (vdsc_cfg->nfl_bpg_offset > 65535) {
   374			DRM_DEBUG_KMS("NflBpgOffset is too large for this slice height\n");
   375			return -ERANGE;
   376		}
   377	
   378		if (vdsc_cfg->slice_height > 2)
   379			vdsc_cfg->nsl_bpg_offset = DIV_ROUND_UP((vdsc_cfg->second_line_bpg_offset << 11),
   380								(vdsc_cfg->slice_height - 1));
   381		else
   382			vdsc_cfg->nsl_bpg_offset = 0;
   383	
   384		if (vdsc_cfg->nsl_bpg_offset > 65535) {
   385			DRM_DEBUG_KMS("NslBpgOffset is too large for this slice height\n");
   386			return -ERANGE;
   387		}
   388	
   389		/* Number of groups used to code the entire slice */
   390		groups_total = groups_per_line * vdsc_cfg->slice_height;
   391	
   392		/* slice_bpg_offset is 16 bit value with 11 fractional bits */
   393		vdsc_cfg->slice_bpg_offset = DIV_ROUND_UP(((vdsc_cfg->rc_model_size -
   394							    vdsc_cfg->initial_offset +
   395							    num_extra_mux_bits) << 11),
   396							  groups_total);
   397	
   398		if (final_scale > 9) {
   399			/*
   400			 * ScaleIncrementInterval =
   401			 * finaloffset/((NflBpgOffset + SliceBpgOffset)*8(finalscale - 1.125))
   402			 * as (NflBpgOffset + SliceBpgOffset) has 11 bit fractional value,
   403			 * we need divide by 2^11 from pstDscCfg values
   404			 */
   405			vdsc_cfg->scale_increment_interval =
   406					(vdsc_cfg->final_offset * (1 << 11)) /
   407					((vdsc_cfg->nfl_bpg_offset +
   408					vdsc_cfg->nsl_bpg_offset +
   409					vdsc_cfg->slice_bpg_offset) *
   410					(final_scale - 9));
   411		} else {
   412			/*
   413			 * If finalScaleValue is less than or equal to 9, a value of 0 should
   414			 * be used to disable the scale increment at the end of the slice
   415			 */
   416			vdsc_cfg->scale_increment_interval = 0;
   417		}
   418	
   419		if (vdsc_cfg->scale_increment_interval > 65535) {
   420			DRM_DEBUG_KMS("ScaleIncrementInterval is large for slice height\n");
   421			return -ERANGE;
   422		}
   423	
   424		/*
   425		 * DSC spec mentions that bits_per_pixel specifies the target
   426		 * bits/pixel (bpp) rate that is used by the encoder,
   427		 * in steps of 1/16 of a bit per pixel
   428		 */
   429		if (vdsc_cfg->dsc_version_minor == 2 && (vdsc_cfg->native_420 || vdsc_cfg->native_422)) {
   430	
   431			max_offset = compute_offset(vdsc_cfg, DSC_RC_PIXELS_PER_GROUP, groups_per_line,
   432						DIV_ROUND_UP(vdsc_cfg->initial_xmit_delay,
   433							DSC_RC_PIXELS_PER_GROUP));
   434	
 > 435			max_offset = max(max_offset,

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--otj32ebelstom3kh
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICIs6010AAy5jb25maWcAnFxfc9u2sn/vp+CkM3faOSc9tmQ79r3jBxAEJVQkQQOgJPuF
o8hKqqkjeSS5bb79WYD/AAqgMzfTJiZ2CSwWi93fLkD//NPPAXo77b+tTtv16uXle/B1s9sc
VqfNc/Bl+7L5vyBiQcZkQCIqfwPmZLt7++c/h+1x/Vdw/dv4t4uPh/U4mG0Ou81LgPe7L9uv
b/D6dr/76eef4L+fofHbK/R0+N9Av3Vz9fFF9fHx63od/DLB+Nfg029Xv10AL2ZZTCclxiUV
JVDuvzdN8FDOCReUZfefLq4uLlreBGWTlnRhdDFFokQiLSdMsq6jmrBAPCtT9BiSsshoRiVF
CX0iUcdI+UO5YHzWtcgpJygqaRYz+KuUSCiinuJE6+wlOG5Ob6/dRFTHJcnmJeKTMqEplffj
kdJILQtLc5qQUhIhg+0x2O1PqoeOYQrjEX5Gr6kJwyhpZv7hg6u5RIU5+bCgSVQKlEiDPyIx
KhJZTpmQGUrJ/Ydfdvvd5teWQSxQ3vUhHsWc5visQf2LZdK150zQZZk+FKQg7tazVzBnQpQp
SRl/LJGUCE+B2KqjECShoVNTqADzdOhoiuYEtI+nFYcaECVJs2ywxsHx7fPx+/G0+dYt24Rk
hFOsTUBM2cI2ioiliGaGadbcqaCKbigmR1yQuu3nYLN7DvZfemO6hkxhNShInkUJ4efjYFjg
GZmTTIpmHnL7bXM4uqYiKZ6VLCMwDdl1lbFy+qTML2WZqWBozGEMFlHs0GX1FgWpzHd0q0vz
dDItOREgQgrGaKrgTNzWODghaS6hz8wao2mfs6TIJOKPThuouUxa5X/y4j9ydfwzOMG4wQpk
OJ5Wp2OwWq/3b7vTdve1py94oUQYMxiLZhNTkFBEMAzDBMwUONy7VjkGIZEUbikFtdtrpfyA
lO02AfmoYAmSVK+fniXHRSAcBgBKKYFmzgIeS7KElXbtGFExm6/bTeptmF6SdAZkUDJCwMOQ
CQ4TKqS56raA7Y6aVT8Ye2zWrifDpth0VvlD4fSFyrvFsF1pLO8vP5ntSl0pWpr0UWdxNJMz
cIkx6fcx7m88gacwN739GqWL9R+b5zeIbcGXzer0dtgcdXM9Ywe16VO7JFHkOeNSQJyQl6Nb
ww9OOCtyYU4enCKeOA0qTGb1Cw69VIRK9K7/GFFeOik4FmUInmdBI2n5Xi7NF5yC1GPlNHJb
fk3nUYqG6DGY3BPhbpYcYoBnY9WvR2ROMRnigE76e9dmCPPYnHrbcVhMXBuG4VnLgyQy3CxE
UwgC4C26tgKWOzOeVeQ0n2F+3GoAdVrPGZHWMywHnuUMTEh5W8m45Tkrm1Uo4MxCOp5HAase
EfCfGEnP4nKSoEfH7JX1gco11OEmfFLPKIWOBSs4Jgbg4FE5eaIGpICGEBpGVkvylCKrYfnU
o7Pe85WF8lgOgQcgXRkzrqIa/JOiDFva6bMJ+MG1wj2YUj2DC8UkVy4YvCTCBsap7Kd+qBxt
96yju1pla5kmRKYQNsoaoLiFUMpsAYy5fEoa/5txBSX6GKyNy5YrNMGi4ZRJEoO75+YkEWCb
uEgMvcSFJMveI9hv16LRWNWM03yJp+YIOTP7EnSSoSQ2LErLazZoDGQ2iCl4ye4RUcNCKCsL
XkXzhhzNqSCN3gxFQCch4pya4GumWB5TyyU3baVb7S1Za0rtH0nntpW4llOZhgbksXsjgnAk
iuxdaqpXmXrZwsMOduDLi6szaFSnbfnm8GV/+LbarTcB+WuzA9iBIIRhBTwAqVUoqu6n694J
Y36wx0bkeVp1Vmq0ZdmjSIqwcrrGvoaMCcky1GlZtwMSFLp2DHRgszE3GwphzfmENKlQv28d
khScKTnsJJa6vajFOEU8AtjgXkIxLeIY8r4cwZiw/JCwgd/2zEDDF8gkVIZqY2IW0wQs2rkM
dkLa9HdzFVLDFXEq8Nyw+9RAeU8AwUuI1GPDK2t5WRxDCL6/+OeL/rO5aP5Y0GaBYE01cEJJ
OS3AvSWh5UA78FNTY3PpIfObaafasJmIVDVDnhQnaCLO6Q1as+zGaGx3YqmDpmVybYqFIM/k
EAvBIiDsORhEkZ63ThcEkh5DlhjcLEE8eYTn0vJN+USiEEwgAesH3zOu4eQew4q9bNZ1+aRD
GOAP48p7dOjSYtbv5y+rk9p2wen768bctXpN+Hw8og4rq4k3V9SKjSmDyYPUUcIWLqzU0lFm
aAhaC5iXIFhFRhvComU+fRSgh3I0ce1EgwHg8MQ0mNSACxnXOPD+tjWJAmy1XoSedUOehEqj
Mc4LU4e2wkyXaOH5xr8+lZcXFy7H+1SOri96mfTYZu314u7mHrpp56yh25SrlNSUuS+gljDc
Q1f7V2UKR6OQlkbgITT2al+3OCur2f8NKQr46tXXzTdw1UY/nbdJnW7G+6pVFVsd1n9sT2Co
IO/H580rvGwPY8YvbY16k08ZM+CIJoJDghgAafmkYIVj44Kd6AJFXavrvY0To7+6EKhdDfhS
CQYLCLCuPJhvzSnkPnZJQI1nAInW4SlXBqqCBBj8f78f2Bl12pcTDLsZ9zeNULFfIy3logxJ
E+WLQ5BzAVHFmLV25xoXWZkaibWcGpydRfwJZvOPn1fHzXPwZ2VIr4f9l+1LVQXp4scAW+vD
kmJCM103xPj+w9d//evDeQB6Z+3bzSoBGAMuNFMljZtEqvDRRU9TllupPA7gd6xyeORCRjVP
kSm69+WK7Ny0wFeXVN3JZ+P2OG4rr7byzzipO5uvyQroQDrnHkxymoKwYC1ROVMQ05mXVWUK
I00TWFCwjoeCCGlTVAIXCrvS1TX7aq5d6ifJhFPprso1XApQuHWrCxiVpyp1ydSd+yu2Regu
uenpgTZYjs5NPl8dTltlboEEL2+7NYWrdAoH2YDKDp3GIyImOlYjAYmp1dy5xd6Ipq7TB8Di
1NY/tCkvo/OVqjDNuuKR4SCBj7IqLkTg3rRv/+4gzh5DO79sCGH84PTj9nhdDq/XROSwy9Xe
wDO7wF3T9alIRR+iOd9dgN0Q38sm0X5b+1HlvtOUsoUBFNpnrUbyz2b9dlp9ftnos6xApyQn
Q6EhzeJUKp9rpbp2pqueyqhI8/aoRPnouhZpLGTVl8Cc5tIhak0H2GolGEaz27QregpoxoXC
QDYlmml9vllrlaSbb/vD9yB1RfsGI4EoFlhVDRAZI6IwLKC0vB/ZICfVa1TxWKdFeQIhKpea
rFHblZXLYXtHpXTCkd2kECHszoiXss1fuhRcpA6lNMuUgijQZaZfv7+6uLsx4G1CYL8j2BVO
rcccUIY6+HIXEj0VzKecMbfXfwoLt/N70gGOYSdRQxmddSlANDtL9rqcXOET/5nDRBU1SYan
KeIzXwagbDSXpIInda5ZW5TfaIyqZLPpss3p7/3hT0AK56YFCz4j1gpWLWVEkau2WmTUKCip
J9hfqVUuUW39t7tImbgVsox5qistTqoqsc6IO5wto1xXfHtV6NZxEWPr07yq9mEk7NYm2JSc
AeixPXUOWWOoQjwZWNCm51xBXZVIetn0CDUzktNhNsAuIROuEiiw5FluTQKey2iKzxtDxuR5
K0c8NyeqlExz6t5gFXGi/C5Ji6XrMFJzqNQvI0lPgamejafWnYHjYTPq0VjV7VxSLzVmxRCt
E8qzJIoPedZB0Yhwq4RWoimv6TG8Thlmo9obvSaJ86bZ7r6Icv9e0hwcLd7hUFRYNSE5c+8g
NTr8OBmCXC0PLkIzUWo8e0O//7B++7xdf7B7T6PrHrxubWN+Y9vK/Kbeg+r0OPbsDmCqjgkE
7OUy8qQIavY3Q0t7M7i2N47FtWVIaX7jp/Zs1iQJO2g2beUNd+lek7MI8IaO5/IxJ2dvV5Y2
IOoPOSfF6N+qlZhkclMmi/fG02wQ3dxhFLSrbvKoolQ/AJ7xANzQGTX43jT3BVxgjmkifYlK
PkAE9xBh7FtliG7STeOeQ1VQs3vSgOGc7cnIM0LIaTRx+X6N8fTWFqjvwaHJ2dk8QVl5ezG6
fHCSI4Lhbbd8CR55JoQS99otR9furlDuzlzzKfMNf5OwRY4y9/oQQtScrq98VjFwOh5hV8kz
yoQ6tmXqwpaVFcDyIZ2VOjtjOcnmYkEldrubuR+igJSQXM3OAkCaeyJWdeDsHmcq/AiqEg9S
fy9HMoZkQSjnO8SVYeHybDw3ci8e6/s4ZvBb2vcn6gN61WHOId0duB+geHCChKAu96ijoLpM
Ih5L+8gyfLCAiDrf+516kjp19ichOU4dFQ8TUIA11hcHbXQdnDbHU1OzM17IZ3JCetZbg/iz
N3sEE7AbK4xSjiKfwjwbxVOlQTFojvv8VVzOsCubW1BOIIbYqxlP1Ea8PKv1tITdZvN8DE77
4PMG5qmS4WeVCAcQIzSDUVSpWxTcVknQVF8WUlcB7i+6ERcUWt2eOZ5RT61PrcidJ4VE1A03
MMmnpa/klsVu5eUColXijqMaN8ZumiuyNp5JwC5Q+bFRZecMxLPOymNEEzY3T8p1tCC18TdW
G23+2q43QXTY/mUVtKoTa7Mc1n+or1sKZ+P5oQ8QiToPDAv7DYJs/1o3AfL6nXiu8SmWkmDu
Krvo10WennUJbd6LQgbD2TFzS8vZgnABavHK1LGpw88fYu5uv/hnGnn2pSbmHjChiaHreFCt
Uip6a/lQUD7rXUug5/qyqEIWrsCpSASj/gqUlLkjiaKB4/fTUM/ddx4Qstmk0FznpWVoW+93
p8P+RV3ze27tu3JGq+eNugABXBuDTd18fX3dH05WJVppEqOIwCLpIxWnD3+3R3tSsYS/3UeW
iqyGObvE2RKce6tcqjsHy25fH7dfd4vVQYsU4D38IIzJ1WIPsrVFc7cuWz2T3fPrfrvra60k
WaRP8p0Ks15suzr+vT2t/3CvnG18ixrGSIK9/ft7MzvDiHtu1qGc9gJsd3q6XddOM2Dnh7JF
dXVmSpLciSAAVck0Ny9WNC1lqk4IrQsXWYQS6/ATEmLdfUx5ukCcVF8PNCsfbw/f/lYL+rIH
mzwY1eOFPoQzQwJZSo7afqrT6D53dfHxfCoOTvfZWL0gfbnaEmeioJQ6iLJK5q1e1M2QiNO5
Z/Sagcy5J5utGNSXGnU3AOtT5vHMmg2Jxww3zDlnoSv3ai+c5EV9s9VczRRVJ82Rurcc2xFO
EWPtTfRhulNZHhOrbhS8HYNnHbatO81mswFaGKAI3LvE1JWfM89BZipdCDuShtNh1lVcFquC
r/R8EANUdVSh7qybHVRXcNykGQt/txrUUUEFNrs26+gJnq0iLzynkXnTkKnzezDmOSxLdYxi
iq/AUu8mrVEL5wq7OGZWH6K6DmizIknUg+MtHHGWut5RnlwIEE/SfDxaunFtw1zAJPwiwaZk
RrHXbNVHL/oqwv3tebeYP+aSKb7B0SMe+k+N9fzfoYvZO/Tl7SCdIzf00cpV+RaO5u4REOQT
arlLYtfdmxxdn/iqccwl6lr1ef2waO9MnQt7aasEcp4SK0b39anozjwCCGU//2hSSLPT6pxx
e1xb/qNRSnQ9ul4C2mRu1A2eOX1UO85TuEGZ9F3AnCj0h921GUnjVHt+d2EHi7vxSFxdXDrJ
4EUTJgqurrVx7YPdQDEvIRlym0IeiTvIMpHvVEAko7uLi/EAceS+TSZIJhgXpQSm6+thnnB6
+enTMIsW9O7C7RGmKb4ZX7urc5G4vLl1k5TfBaUBXM/HZdXmlsG31UyU5/9YskKmpYjiPlZr
upnnKKNuGh71PW91gYBAYE5deL2iwB4fuQ2uo7trkzU9IROE3dGg5kjR8ub202And2O8dJ8M
tAzL5dUgB41keXs3zYlwL33NRghkE1dOF9BTlaHa8NPlxdneq75b3PyzOgZ0dzwd3r7pS+LH
PwC7PQenw2p3VP0EL9vdJngGZ7J9VT+aUOT/8fa5wSdUjNUNl8FdoZnoyFO4UrV+pCB0fn73
iO5Om5cgBav7n+CwedGfVXfW1GNR2KqCYg1NYBo7mucQNK3WLnxA2A0LMSDHdH889brriHh1
eHaJ4OXfvx724OGP+0MgTjA7847AL5iJ9Fej6NPKbsjdXEAa0JMBJEm2eHC7cIKnbterLs7A
GmH1FRB2L7Nm4VIsf4CjEO7K3BSFKEMlcn/caUXDWq0Q3KsWwyAau1M39VJm3VTkiEbqm2jn
54/qBSObU69H5udTukV9T1nG7UfDWoJ6aH3/OfgFdsqf/w5Oq9fNvwMcfYT9/KtxV6oBTJZY
eMqr1gHYCp7dhUIFLyHBjDxJQ9uxO1i0ZM8JiJ4x/KwyW88lCs2SsMnEd8ynGQRW5zAqVzvb
VFqDsnE2FsypXs3p+YrZLDF+j4Pqv99hEup3HbzPktAQ/hng4bmrm+aDg950f7L1uNDfMlhH
xZoifaedmqoui1Tftg0s43ISjiv+Yaar95jCbDka4AnJaIBYm+14US7hj96Q/pGmuedkVFOh
j7ulJ+9qGAZXCnnLSRUZ4WHxEMWfBgVQDHfvMNxdDTGk88EZpPMiHVgpfTkE7GKAg+PUc/yo
6QSGH7npKaAu7U8zsjg7LuvzDEC0lmd4prkcv8cwGt6XKeIyfxhQVxGLKR40R8gqPZ//ahEe
uTuuNdQh6Xyguo5Dy/Hl3eWAbHF1muMNvpppEnkur1VOMh/yoOrXu7jBQUNHl56PdaoJSjJg
5+IxvR7jW/AI7vSnFnDAUh8gCFGsvnkaEOIhQe95twiP767/GdgxStC7T+6ERXMsok+XdwNz
9R/VVAgjfcft5OnthSfJ1vSq+jEwfs8GzMjUA1Nt4df8Il+VZOpLjiXhnBlFaqFouS4L17+1
qDtd+Xt7+gNG3X0UcRzsVidAr8FWfcj6ZbXeGLBNdYGm5gmmbkpZqH7NT6LP7RKKH7vvWdpX
yhzSZHVKZwZQTcBk7o4kmvrAOHXXSnTXYNv48mbkWVI9uIokui8/j6CJneYa6gSVtIgStLPu
q239djztvwX6lz4YKuuy8gggkO9XQujRH4SvsFwJt/SJFqYVCK6Egxa3hJrNqlEpS6B0QGmp
+5BR07IBmkqRqfBcTa01PUT0eDlNnC/8xCIZWN05HVD+nEoixHnqnv+4OnNtZh4JKmLq9hkV
kUtP5KrIElZqkJ7f3nxyr6VmwGl0czVEf/R/iaUZSIzc5qmpEHnHN+7aS0sfEk/RlyM3RukY
3JVDTafydnT5Hn1AgN8hK+dsQAAAJwD83XarGTIi8TADzX5HY3f4rBjE7aerS3cRTDOwJPLu
2IoBAJDPy2gG8EOji9HQSihPBeP4GdRFKR9krRgiT2VSb2BPJlsR1XkSVzdUB7oH53HjgRD5
kP/QRMnElIYDCpKcxokHCOVDfkQTFzQLWWYpr/IjlH3c716+933JmQPR2/TCCxIrSxy2gcqK
BhSkjGRg/esIPbC+T/0vu62T/C+rl5fPq/WfwX+Cl83X1fq769qB6qc+9fUPNJSTuA1UIj5R
9xp9RyBxob5aPRNdXXkNLsd3V8Ev8fawWcD/v7rK4THlRF3Uc/ddE8uMiZ7QTflvaBjjQuTZ
EXhWz8mqL/2XsmtpcttW1n9lVqeSxTkRSVGiFl5AJCXB4mtISKJmw5rYk3jqOLFrbFed/Pvb
DZIiQKEB38UkFvojCOLR6Ab6AfOMOtKR10tGSvp4kiEgaYNWwvZOelSkxNVFzmI0hTYfgFQk
6dxSFJwahFXBnjDshjY0xJUIcuayaErCdFCczI2A8u4su14GbCSePlvvPQvdD6zIcmKPAT1/
ZqzdTzw0oJxO+memV8nrt+9vr7//wHPkprfPYYonurbwRiOln3zkZtUiDmmtmQJgj/Qnml0Q
6zfv57KmlEhxrQ6l/u339bGEVSLVwuENRXjxUO9mS89QwT7VV0kqvMCjPKvGhzIWow+uHoaz
ARWmbEzH0NqjItWDS7I4pQ4KhisUYXQ9UyvN2ZNeaVqw20C4ntXOreFn5Hne/G5+YrM46XSR
xFAn8IxCcGacAjBvzeXY3FKzgmQio3weMrO2jATzqkMK1cuu4T6BRqy5ePQlXbGNIqMVofLw
ti5ZMpv126X5rGEb58jHCNv4ojV3RkxNH8H3ZWGWcLEyQo+7NiLN57e+6oOOCQUfjPaa2vcW
zP7MYOCpODyzeKv/kkFADhfpf6T5ZyBtJv2YXnDmJ20MxOFUoNUcdF5XmU3OVcjZDdnuCUam
YGoC07evq4itKuOPp7kx5B1x1kZDJxzSrJEmWdN7+6JOmJfTjWyeRTeyeTpPZGfLeBOXOv/i
xlC7yiMwQ3mhrcp9mvOCG/neJOg4GWKibye9A2nGTd6l6lPoPKTZGWa+2SurgdkwNzm/ry/N
T5kMGjgtotR3tj19ig9cWx59SVdUDayUAna7HG1X50zmvqZ9We71gMb7s6PJB+3Fh8psYK0+
cGKXlBs3Ax75YduaSYXQr9NS6pA6JeJJyXLdeXNvPuWHcmLh85Z6BAiENRVSqOqWC+IhIFDP
EG4Lu9xbmKce35s3ive5Y2iHowyN755ziiE1xz1xlHe8OiSHHN7CilKb+HnWLjvqNiprQ1p5
A2pzsZJ3Jh8NtT08rvXZdmyiKDRzy54E1ZqPdI7NUxQt74wpzC8t7xZyEfvR+xUx04u49ZdA
NZOhS9fLwCHlyLc2wEKNqy6/1loYPPztLYhx3qUsKxyvK5gYXjax2r7IrJE1URD5DoYC/8Qw
7Zok3PjELD23Rq9evbq6LEo9jFixc+wEhf5NvIP3/P94bxRsFvoW5B/ds6Y4gxCg7Ycyeldi
1jaVB8uj1mLAl469dwhOkhZ7XuhBxw6gisDMNXb4NUVfgx13qHT9rZ9a6WPGAupS/jEjxd/H
jJie8LI2LTryOWPoBbWFJ7SbyjVx8jFma9hVSJO5xxjNBClP/Dp3Too60fqkXi2WjtVQp6g/
akJJ5AUbwuwESaIsDVXWkbfaGJlCDXO5YY2Zhp7WtZHUsByEIM3LusG9kTAIV59M00dzlWUG
2j786VG+iaMpKO92OIaOqdhw4JxahfHGXwSe6yltScDPDXWLzhtv4xjFJm+0gU8rHpO38oDd
eMSlhSQuXSy0KWNgoGlrPr5phNwltM8TOczqnxi6k55Sg1XVNU8Zca0H0yMl/AvQAb0gNgl+
cjTiWpQVaLiaoH6Juzbbz5bm/bMiPZyExin7EsdT+hO8iysQSTCaRkME7hCzI877Os86m4ef
XX0ATmze5jhe7WcwrMIUp16p9sKfZoePfUl3CakJdwNQQV13SWIeKpBuKlPXoVA5eHQp+j8W
9q7LkwAiy2IM+MgpttpjuNgy4th7rLjLT62MkVenPwMcori0xKG4BB84mvCQHF9iYEXGIHdx
4owcIWWM54U0fThcMPQkzLGMq7GCL1Ay3vrDSx/g52gcYrpvyROswnxiNpzv0YA2itab1ZYG
iGgRtCQZxhXN8Gz0aG2jD4duJCDmMUvo9g+HCyQ9YTBBLdUnFUqrvpUu4sjz7DUsIzt9tZ7T
x2XH21QOn6bkxlUGM5iqUerVXXthVxKSofmg8BaeF9OYVpC0QY100kGxoDFSI7OSpe70Ewhx
1/0qBFWReRcWMggjo19ftFDtewZ7MD05H8eaTbJWL7PN3zsIWmSVKGxZPxo3f5ooUm9B2Irg
BQSweB7TLx9MYUj64IC0B57j1/hf27iCDr3ZhJRBQkWYapqP507Ntg/GJH2Jtd0DSTETZt6M
xCO7UFcgSK7SPWtOZrMBpNciizzC7Wyim8/zkY4ae0SoPEiHP+qEE8m8OpgFsstMoB2DyHSX
xHRxhfDpqi3vtQkTTU+KBD8tJpFADSl9Vq80VwMXqSTlUsVAHU+TDaTx8JAg1SDxa1Jqie5L
5rlY8yYPTSZ2aqXTwZmJmILCTvZpzYYjZRPtptqZiKrPi0pQo22q5YLAP10TVblTSVIASIvi
ZkaYylhCD5dXDAf0y33opF8x5tC3l5eH759GlEHouFD3/nmL146E/KoE25l2syYxStFnTWuH
n101cxIfXLm+/vhO+iHxojrpoQOxoNvt0LE9o4ziehDGxqLCevWIPj/iMScmXg/Kmah5OwfJ
tp++vbx9xkR5N7vSb7OmY5iLJp05zusUDJ1kDDA6gzXAtdOia995C39px1zfrVfR/H3vy6u9
N9Kziz7jM8r4UeGV+ieP6XVbslq7/h7LgNtVYRiZXeBnoI2hlyaIOG7Nb3gEQYrYITQM4Zms
YHyPOBa+YZIhtF29iszGgjdkdjwS3vM3iIjZaumZTTdVULT0HP2X5VEQmK8WbxjgFOsg3DhA
sXnJTYCq9nzi1H7EFOlFEKrWDYMBBvE+wfG64YTLARLlhV2ImBcT6lQ4R6QENmC+gr1BWuGs
JWYVyq120NYYi05Z8IrWjj+Bj/iGoo5lapzCqXx7TUzFeCYM/68qE7G5FqxCEdVKBBlYi342
QQZLZhNJxheXDvba2cONnma4DxIWqkojUpQ7OHEUML2tPMWHozFh7wTaYR7jwfbo/kX5/JhE
kpq05sRRWw9gVZWl8vUWEIx9SLnJ9Ij4yiqz6N7TsbtIh/Eecm5A8We2SqYRtdc04Sjn5NsW
hAGMiStTCZHhes3i9gDAruv3OdumPUtWMOlvOV+aQwEcnt8+yrhN/LfyYXSnHdUevOxSDnjw
J/53SPw1qUeSAAI3zBDD1OrJGd/2S3X2WM0I/wlJHSzUZhXP39z4eGRmq6aOHXWwaksBThJh
JO1Znt6bMg2GjaaunfzuDfJfL6l+en57/vAdo5ndoriMurJQEn6dFWE77m1JkZsUTZ+euFGR
I2AqO1zuywA3FWP+i0TL24gR/zdRV4mrUndvEE0WDmGI/HCl9zfLMONTH/2M8KctyqeSuqvt
9o35SHPIXQfCiPlBjNkkjOfUmQy8jQlbh1RFQzkIh7NgUlBynIVm6h2dXt5enz8rWof+vWM+
On09ASHqU5jdFyqpYaWF/Cytm4rcoXJpCkWlgu4GXCVq8T9VQtqy2kwp6u7EaqGkFlGpNabs
ytMbxNjutAUlL6HSNSpA1lSY4PqMtTnBCc1Rbq0TfhQR91gKLC9bk2XhACl3qvdgH+Xpy9//
xicBLWeDtJG+jzOhT4khZV6z5YbxBfk0IO/jVIj1a7DfMi5MBgkDQs+9oxQq82Ze63tjGpiB
eMucaCq2VNrEcUEcFt4Q3oo3a8oJvgcNO8d7wfauSTNAXbDhnLFqnEhWE/fCPbmu6J0IyLsm
67LK9Y4Yb1Ex+V3C9zwGrlUbN6EZV7qrRuYaIw4agVMO2YkNo3w4j0EUlV0FyoxzefA9iC0+
D7zKeddnTDbdNsHO1CeBffeXcnw2FvZJinmZE5e6E9Di6YwyKt66mCUoTMBBx6kUMfxV5qRI
57m8BBMpu951+hhq9m7/7w8cQBS9PyfyFVN3+NFJHYoXu1Iv7tP3aocxWCqT5RJnH0A3J4BB
Sh8uVO6W+otYti+3U/hpbPRNCsLASbMQTFX8AAoFlH/C4Ej2sLB99dwLA/MJw42+IqK5jXTC
Z1PS82QdErk+ejL6LpB0HhE+9pJI+RkiEf3nzHoPUgtpaGXmGZIuLbO6fWXOkIOQhjdhuKF7
DuirwLzJDOTNysxukUx5IA60qr6Psivn8z/fvr/89fA7hjbtB/zhl79gJnz+5+Hlr99fPn58
+fjw24D6N2ysHz69fv11PieSFFOWy0C5VkfBOZbwZ0RYmqdnurdL+nxGDmXs8FhEUH0M6N5s
eH4X9lgh99vQXYem/wOe8TewesD81q+q54/PX7/TqynhJarLJ0LJlR/TR0YF5W1/INRT/Jpy
W4rd6empKxsiuj7CBCubDsRpGsCL61yXlo0uv3+Cz5g+TJkxWjAzit3M+ncW2VwnZlRY934C
YbRhOp7lDYKM0AGhNgCV0yvPBSbzoabSRcbKECpEofVZP+ZPGJWZij/kz99w9kwBOZSDbq2C
Xn4yCytIbvuQXL05Jwmz2dEgffDhIenT4iYheHuOvtRk3EHAoPRlo1ctoyL3Inm8KScBILxG
wGwXxpMSpE8Jx9UxaonDPSS2aCxKU+/4hUZ+uhaPedXtH2cffZsG1duX718+fPk8zIe70Yc/
SopAMkYaxhzKdABRRIksXfktoeXgS8hl2VTEKcGBCNlT6TGLekFEVA8fPn/58F9jigBRdV4Y
RZgQOr6/yhtuJntzqAe8FyNzWilXlM8fP8pMtcCw5Yu//UflZPftUZrDi1jU5sPWfQU8nchh
cjHLJn1GC3YmQhRIKsbVNh0a37JhVJlmTqKW02k5VNDhkutm9RVaTyHCLG5jIHeajJLtHr8q
qcLFyvzdWyaAa0HzGn9NBG/QID9Ri1lmGCHN1tzFY2Mp+vj89tEnQ8eNmJy13npmuE2BCGfP
oTUAijZEYOQRk1XR2l9bIUk6JHjHly5XhHA9ouETlyCg27sp3wZL80vHD9wzzAefidjfLE22
1HeTTRaMm/uMeffHOn3sKYMgdQvgnKwDj4jwNUGWPwMxX2pOkNxbEFeNOsYs7esY83joGPPd
qIYJnO3Z+MSsnDACetCNoQKJ6BhXewCzog5hFIwrarfEOPq5idcr13jJ0007RLSVvZKkWTli
lWOscEdLeHgENZcISThgdmsvWoRmOV/FRP6OkOZuoDBYh0RsrQGzz0IvIk77FYy/cGHWqwUh
ok4I+4w48MPKI5TkW/+JyMybRsD7mGC8IwB2tdrzHSOJadoZ5QQ5YiT/s09Oidk43iViYMr2
aYMYn4gTpWF8+8dLjLvNS58wSNEx9jbjjkSd5qiY1WJlb5AEeXYuKTErO2dHzMY+e+RJ/9rR
iRi53rXOJSZwtnm1csxWiXGkP5CYn/owx0zM4ypwbX0iXhFpQiemHZM3B8PsyYkzxAng2BgA
4KzBMcvztb3HAGCfTllOhTWdAK5GEtZcCsDVSBdzAcHABXA1chP6gX3IJWbpYGESY//eKo7W
gYP1IGZJSMUjphBxh0EkMLM1FWJzhMYC+Ia9CxCzdswnwICaY+9rxGzmaSbmmEq6zji6YBeF
G0LdzKnbpvHp5iAcaxwQARFud0LEjjosB+I3eSlPvXVgH8o0j70loScpGN9zY1YXn4rROzY6
b+LlOv85kGNh9bBt4GDMjRDN2rH7N3m+cuyRwHQ9P0oip3LTeAuHHAEYULWd9ayjtUPohh6P
XOJwwfyFfZdEiGM9ACTwnfsWFR96BBzy2LHRirzyHEtcQuwzUULs3QsQKmeTCnF88pmzVbSy
C+Vn4fkOGe0sIt+hf16iYL0O7MoIYiIqXLqCIUOqqxj/JzD2UZAQ+0IASLaOQirLhoZaUQfr
E2rlrw92pa4HpQRKbmiEEeiFYUry0ngvgd5OZdPw7cwapDGln93GOTPCkXB3bJP/+Pz99Y8f
f3/Ak1aLL2q+SzoWiwjUJcIwFAFNsCam4kgmBPMq53Fvy0+odfJ59EaStxOUCcKEOmQxEdEW
MdKMdkHwJAlINuHayy/mQ3v5mrbyFy1t/7pDu/mEuvSR35uwzYK45MTHkRz65E2LArE1QkLM
q2QkE0r9jWxehgOZcrGT5KygqwapAEOKWL9vxNg+8MBBA/NkjxoxIOfIFMqx+TOyKu44YXeA
NMomAV/9nhVPXZyXVBQmxBzTvCIiMyM5imTiAQedHj9JXxGWbf0kbL1lSGhKA2C9ps7FJoBl
mHtAZD4onQAEO78BoqUVEG0W1o+INsRx7o1OyHET3bylS7pYUWKgJKfFzve2uXkGpk8YcYrw
JcPHYyv1zCvMC0FZASOkToXZsAWJoGuEsIjpzq2TOKDirEu6CBe2x+NQhIT+JenHiBCWJLUI
xYqQeZHepLElfBgC+HK9ah2YPCSEMUk9XiNYIzSrQkXASGTbNlzcZxDUHwY5z0K9NjEVXALI
AlOjBEHYdqKJmWVHy6pgY1k/eA9FuNINr8lyywxiWU4kARJVs/IWxIUUEsMFEbhevlcCLJyj
BxAnJDeA79FLEz8NPt6yzw6IkNDPlLdYOhABEWH/dQNsPPtefQPZ9kQAwYZBiPPikoGqbZmR
AMCwVfYpe8k8fx3YMVkehBamIOIgjIh8PZL+mLeWcT+3kUVoycr4ULA9kdtCSmc1fyoLZu3t
EWPr7EseLS27M5ADzy6eDBDHS4Jw4aplsyHcvpCJloccZNa1RwUsUEEgMVrYrUBBysIrRb6b
vWJMJGnTJKZK6nR/yhh1plfbmD366ktrCFM+3P3b89dPrx++3ZsAn/eYqUUJwzMU4KaPFqHN
O291M0XWsxzBzy6pOnZqrabAEiavxgkjownQpNmOyBGPoGPeDKbDin/NUL7bGkm7LRqoY7Ba
6dVkIqJnPstg1bzzFgu9VT0gS5m0xcGDKsI+HMHo99PBKCSYNyEn7ciGXot1C82bTevL3x++
fHx5e/jy9vDp5fNX+BdarWraJtbQ21+vFwszlxghDc+8lXlljBAZEQZUlQ3hznKHm8u6itkh
1XjZelbnpsTicgBLmL7MWK36lP5QDQokIRwgmeXJzKC5b0VcPfzCfnx8/fIQf6nGJLi/opXi
H69//nh7xgWqmlL93AP6u4vydE6ZWWRA+pkKHieJMJ1J4ikxH5DILybs45CW79neJ3g10mNe
16eme0wJQUd2eMzqLrl0h4SwmLuBsnNCf8JjS3/CFvYu+snBC2Q2rAqgYoWMnjKmkvj6+fmf
h+r575fPd1NOQu0N7SENBxWVXso9iKNv1BH+twmIMxylwt73vsuSDWVppTQQcHvQUM2yxIQr
yjNGaukKEWwWROyDCV1mPE/bLosT/Gdxanlh1tHvW92s0lWQu5qtoCPGnOiUH8tuGVzOO49I
/6IMB8a85SAzCFCKN/SW08NFVQLXWviREOl8457yh6jzRJ1P25on+1TfNPp6bxRtqvExoMnD
9u3145/3jI4VDCMFtPCPloyfJNdjUqC9Db3OklO+lXt1QgTwk1sSTG+MvVwmhKGjZA3obXvg
Fd7VJJVMkbtPu20ULs5BtzO7QkomBxtCJYpgSVxo9p2FXLoDoXxlWRewS8Efj6hzlh7DNwsi
JcRIp65xkS4wACX8N14F0CsYDIaG9hm1eil9bdk+Z0CzmiWBvBO7irI8GxBNsQphxAm5f9yG
WXJeh/Nj5NlMvp+Gej2pKNiZ00uH1XG1p/eBvG12ZgsvpO5zzz8FxEiihwaCDi0I9Wsi49WA
AZ668YlTKxUTEBfzIybnsPyDR/PeOILqtGIVZSw8YIDjhMToKJB1ENJr7T7/1z1vrnlaCCmt
do8nXh9vid93b89/vTz8/uOPP9CVYu7cDwJwnGMcHYVfQVlRCr67qkVaBO5BUpVyq6FZWCn8
7XiW1WkstJqREJfVFR5ndwSes326zbj+SAMytLEuJBjrQoJa19TyLYYPT/m+AAYHqo8pmNb4
xlIN5QKFSbpL6zpNOj3XCFBy4JSDHmGWCwAjeCZbI2a5yu7H6NPoS2S4MsJ+kjIX9ZoqNzNM
fPC6TWt/QYW03YIkCAuDFeYpL0enESTRHkII+9RLPDLeOU456U5IUWtOpMXFdq0JgQiHhsHG
T77Togxgf4irR6j1PZX8VLPchRR2pgwokUpkbMTeSUuYz9y8aQP9eK3NshjQgmR+vDDRzmWZ
lKWZFSJZwPZKfo0AcSal5wurzfEw5DQlKwVNIKcctrCP8iY+0d9DaTo4TbawzbRiGdIrAFWF
E3GZjJNpzJxAArbQXfQUtygF8svW3mzxDju0kYVLtrB9/vDfz69/fvr+8K8HkMvJ0H4os8cZ
a5oxCLXizo60TJyDcPFo3twR0G+r5i8b6dT2jXSRlP7SrL0i+bzf+8vg/yi7subGcST9vr9C
UU+zEd1dvsu1E34gQUpEiZcJUodfGCpb5VK0bTkkO7a9v34zAZICQSTkiZgel5AfDuJIJIA8
zjy71IQIp3ErAuDscH71fTwh7jbkVybi8uR0OiZUURCiRAySnJUJHNUubd450NpMGqz2O/pj
SG/iffb0CDpinlx/vzit5zGhmX9AekF+fU1I0QaK0Bs9oOLknNLL1UCzy7OTb7H9Ve0A84Or
U+JZUWtWwRYsTa3T/cik7uxpAhlnpQ3fvt8+wZbZyLJq67TfW7KhDxBIhn/VIhuX6NYxi2Ns
qU3gwoCiQ5c2vWT4G1dJKm6uT+z0IpuLm7PLTrQovCT0qzFIF8OSLcTGugl9ZCRe0bOAs6GL
TImFdrZjLb6Rc0pvGmYD1xOtwwh3j2vLJjNtkpsSBrfLhzwiqyzBgyMQNgcjCok9myoeHEzf
yiJMJ4S7YwBSPsCqyCrVYtGHpasMVV/X9+jnBDNYpDXM4V2QjvQkmbGKdlCnEEVl57uSmlM7
Skfl9oOFpFcFFatCdmQYT7l94ihymeX12K6XhQAWwUSyS0mKzOGXg55V1HsUkhOPeXHsyC4f
N2iyI9A70mF6TLK04ILu3hBfEOjPD+OQUqpSZLvEJml305D+skmY+JxQXZD0MbFPIjHKYsNp
V48M9brn43RJd0jFZJQjkj73YpgyJHnGw7nIqABG8suWBc3MEIABEOj2Ga6oerQfnk8oliG1
nPM0Itw4q25LBZzsKE+rCIkZbTos6WGazegpgT3rZCXyfCB9RDogMUqwDvpyDMILXQdsC3JZ
0CXIGAOwj9KIDD2SO2a3jEPinoMpEbhd0Qpuvw5GKgZmpid/Dqdf4Flx5lhccM5N0L2gA1B6
8ZLwfSAB6DiLOWpA76t4XU24/5UY3PzpKgo8qTgWQpEx5tGfIDzu6iaXH2BJR7vSmHKHKBFk
CPWGGsboKYy4TZCYKsW4H/QXUv4ZkIugQ1NPODYHAZJV+SNbOqsouWO5Ap8TlHWtpEdFJUrl
GoXmpyij1Dlxn6A4qmuLWXCYqyT1Liwy5weip3zm4hdKRbuOCM82UsSIc6OC1kWcRXZSjt6F
bxf1MASERdzLub2XG/hAwaCp36zm4DqsV3dXnPRAZlaluwDSs3XOWPUKtHZlEeM13gaCvK0u
IjWPp0BvNDL6iehvJTOAcI6K6sgTdcSCHqUPU342e13jpSmwMRaig/DmsDr0UJJs9vfrp6fV
y3r7vpdd1gQ+6I8KHBk84No1XoByUZpVBcvUQ+XshKcZcUMqO6Wc1POIo0tp4k26RfmxPEiK
0px6+veBXC0qYEUpyHJh7C1vzvoFJcTERtpc9rfvjQc9IqcN+o1zOyiS+a++LU5OcGSIJi5w
FqiB62WU6YE/MTRYTUTPeeoh9eAbVCOFRFUyvcgy2ZN1adOh6WBliXNFgFQfWAq3TDGZPhax
q9BIu9sx82eL6uz0JMrNLuyBuMhPT68WTswYJg2U5MSgLTAqvdPDlR360JI6HI7s2PdVDYBs
k4gxmJYLUVx7V1eX3785QdgG6bsmMWSCbkY3ISXY02q/t51k5YJi9o1G8pdCxpmh11NA5y2T
oU5TmpXh/4xkF5RZgVfmD+tX4Kn70fZlJJjgo5/vbyM/nkpPoiIYPa8+WveOq6f9dvRzPXpZ
rx/WD/8eoe8jvaRo/fQ6+rXdjZ63u/Vo8/Jr22dmDc4crCbZEQFIRzWhbI7iAq/0xp59+9Rx
YxBZqJ1ex3ERUAo7Ogz+TYh/OkoEQUHYIZowQrNUh/2oklxE2fFqvdirTL0uCyxLHa79deDU
K4jIWzqquQ+oYUDY8fEIU+hE/+qsr9amr22ve4HFBcafV48YN8iiyiaZT8AoixVJxlOVYzrx
nFbxlPklFwgI/8Byi54TtjwNkY7phUogPAjpDkYG/a1/T911i3RUTfCbYXSHLltfLCHyhwkn
rLAaKuGGSPK6oCqJWzfVtJkgQmpKpswz6pFJRkELJ1lJXgVIhIOZt/OULb8xwoxMwaRlJD0q
AX1VILfMMuAysAXdR3i5GMDoxkSwF9lTHGQwfzahpwdhyCV3hsIDAXXG/YJUbpafks29Avqc
RpBOAJUYIsJS7Y9jvigrxzriAh8vCO0mBCwhNz1twjvZswt6VqIQBn/PLk8XNA+KBMjS8I/z
S+IhSwddXBGuFWTfY/wkGL6wcHcRi7xMGDeS3WLMf3/sN/dwkotXH3a3r2mWK/mUhYT+UMsn
zk2TIu2wRtTTL2TiBRMipEm5zAn/tnLN4tOHmPPSsaFUMToMpeIjzm0nkSTRfGXn80KEt8B6
LInqbVgLfpMwOOZkbGpJag5SN1rYMYFRc0nn7ZjTHGB1vkvYVxF8xdyfOdVgObT8g1QRRISL
Y9kGPk5QWrP2k+lWFpOY/41Qf0MqBoEWQUKYCEpE5VMxnJFciYjOW8G38CuYF3R+duv82kbR
j3L6jJiktG/qSZjQ0XvwxA6s1z4PPQYHecF9VC6mQuKOeQoNS20DEQYe064fukwhpTFalEy9
eFupARps2+8WgORX4+GFglimDPW9+hJ4gybqAFJnBmK/bjJq0/qrWjg3McIOGVVF2hCslm5U
SueafYxSQk/CtLJEKKBmSEP20dCEuK1oIDISE9kOGQTcUi8mt/p/jjug+912v/31Noo+Xte7
P2ejx/c1sAr9jqy1VzoC1fhV6U0MTbiGwuKpNJ/JsmmlxUWLPAzfAQe+HJUu9aAh6loMaQdt
gOdnOCcy6cpWKs9g2E6dkWFBkQjsy+tQIF4KfL8g3FFpMMEvKX1SA0X4tOmjCHedfdDFZ0CE
4ocGYgELvxE6MwaMMgbXYQIVDGtmf+PTgDN2tCwV7RunqH2WNGrxPi9FPS/yOIbE9Ow6yrXN
VXVDPyLMIa0eV5cXJzCjmqurTrXBOn0OjYzmsFWlVrfMKpPYvu96Pj9aEQTjhdTZ+NAYlZIX
ma+1UAUzkaReu2xla1uGx2O/r+vYMnzo1Epj6sq4b/2y3m3uR5I4yleP6zfpUVoMl/UxqMQW
6+ft2/p1t723iYBFmMABFr6TWbmzJbMq9PV5/2gtL0/ExBpWpS2xl1NjPKhagvGhB0MnoG3/
Eio4RAbDj2EfRnt8pfgF336QhpRB2PPT9hGSxZbZYgLYyCofFLh+ILMNqUrNb7ddPdxvn6l8
Vrq6SFvkX8e79XoPgvN6dLvd8VuqkGNQid38lSyoAgY09aSyyC/++WeQp52aQF0s6ttkYj+9
NfTUNPdvH16GhcvSb99XT9AfZIdZ6fokQVl1MEMWm6fNC/kpTaCmGausTbVl7t7CPjX1DlXl
aPo6GxfhrbXTwkXJKAcIsA4JlRxOSDppaT+KzpKQPAzl82FwB17cSsNOS0Ch4hZvkXQBBQNS
cTuvGJTTCY6KqWM4pV7QoRzjAFAtlU7mUfetRLW//p2MctIfLYHR/VTxYPTxbnTB0MbXWrLP
0EQ19eSBnkSht/4mxkQdEDHZexBHORhEgieL6+SWjA2KsAQ21hj+H6NXuIrLF159dp0m8i7h
OAo/0zpg/R7UcuMdGOmlhdmO08XhVtV7edhtNw/6iMCJpsiIJ9oWfkDH3E9nAafMywntinRm
C1wSzUdvu9U93vBano5FSUSfwfC5tamg2D4dD4s85BznxI3amDD+E5ywghAxJ31jyjcd+Hca
Mvu9goyzSSiIGlHKlZ3LBnYWNQ96rHPmxTzwShDIRC3DxNtisQGNY0jo3ql0UZ4BgeKC5wbt
QLkAykHgkgkYXHecFbJMg4TNygQaYLLYqF4SRciqgjpuSxAVjuKHH/Si0+JvEgw1JT7zWNQ7
Ghchhw4DGtEPP2jSgiZNxoLsWb90VJfy2JF1fEbnBIqx6g4Evfu7fkVxdiz6A6LSmnuyLLcN
P94toL+TaS/QbIJRYUvYHE263j7gwcUyNzUQO7ppNheYCVwlyOC+vaI9RbD2y22VlTaLA9Rw
GIv+TFZpdb9XxnJq2zsdFbxjb2mQ1eJc3f/uP1WNhZx91vXeoBU8+LPIkq/BLJBL3rLiuci+
X12dUK2qgvGA1NZjL1tdKWXi69grv6alUW/XzWWvtxIBOXopMxOCv1v1FrSIzvFp+OL8m43O
M/RoAvLEzZfNfnt9ffn9z9Mv+iAfoFU5tluWpaVlgbQs1f55SkzZr98ftqNfts/GY5cxJWTS
1Hw01InoRavUlptMxK9HxRkOC8UggQQXB0Wo6SdNwyLVuxJK1H+WST74aVvnirDwyrK3ZKJq
Epaxb2XwsEWjC7gihD1FWxutrtSET7y05Opz9DLVH3oALJ3cVYmBnJFzwFeWYdLr7Kzw0klI
Mz4vcNDGNC2UzIiiRnRGIKHiH8nfHW31Hc2hSazwEoIkbitPRARx5tihEo4OHSi2lji+Pqdp
t+niwkm9oqmFq9IcNQeI0BlLMSMZ4aDElk800b76U64ljvtcDX/Pzozf5/oUVSm48Gx1IfHC
hIu5VT1NgetTo7aLWqs/lw2U26y3zKrSpMThQqc+m2XX8rEs6Sze0VwDREOe3nz5e717WT/9
td09fjG+DvMlfDI0IOiGLyvrtM8mMSNunk1s+SC1DkUDQn4H8nyQmkXY3lkmMmZ8juGDNYUy
lDrMn6rrtbpMPVBRpYV+6al+1xMhBmlo1gZ7VKoc3hxmoKLST3sszCNybXOKkAUezdaoeR3r
8zYW7Y5p31IR0O7K9QXhNL8Hojzr90FEWIMe6Jpw32qA7I/9BuhT1X2i4ZQ9qAGyP0IYoM80
nFBAMUD2lwoD9JkuuLK/Uxggu8ZaD/T9/BMlDXyW2Uv6RD99v/hEm64JV/wIAnEZ535NyIx6
Madnn2k2oOhJ4AnG7dcIelvo/C2C7pkWQU+fFnG8T+iJ0yLosW4R9NJqEfQAdv1x/GOIh70e
hP6cacava/s1eUe2+99BcuJhyOSEUOhqESyMQTA+AknLsCLcTXSgIoN99lhly4LH8ZHqJl54
FFKEhG5ki+AMVdnsmmYdJq24/Zqr133HPqqsiiknTOgQQ578qpSzgc1W6wFCvzhTr1Xr+/fd
5u1jqD8xDZc9AQR/10V4W6GGm+X83kpeynYDBhdzFDydEAeApkj7EUDdj4QBDQFCHUToL0ZJ
YlQcCXWjhtFwhLylLwtO3EI6b99aolXYkEoF0glpCk3GSxl0J1RLv56eOuIeTg0mzF4dSqRM
YlDZXjkFstTc3gMcvtPTJLhYJDdfPlbPqz+etquH183LH/vVrzVk3zz8sXl5Wz/iyH9RE2Eq
BV7pNWj9grfFhwmh1DfWz9vdx2jzsnnbrJ42/9e6qmyqgkNUia1m0zrN0t5pWJJAupbd0bWY
eFhqwaioTmJbNRF7k1oy/UXde5k5+bu3fZx9WacHsvt4fduO7lHPv3Muevh0Bcag6V6umW70
ks+G6aEXWBOHUD+eMp5HundZkzLMFMFp2Jo4hBbppHd53CQDk4ItnohRrCCVcNPTKrYdBDWq
reJc/nWVK//Y2XDbk1UZARdxQQhfvw1VxXtvp0D+/vNpc//n3+uP0b2cDY/odeKjpwvUdKaw
v6g05MDO0dtK2TF6EYhhpBjv/e33+uVtc796Wz+MwhfZRHT1/L+bt98jb7/f3m8kKVi9rSxt
ZoRJTkOeuMlwEIT/nZ3kWbw8PScCYnQTfMIF5Q3LwNgdSuigMyoiczOBs6ISV4RTLx0DlTlB
IrwlFI67cYk84Fyzwcj4UtfmefvQvwBve853TlBGODpsyaVz7TEitFLXZGfhcWHXTm/Imbtp
+ZEvW7jbBnv7vCAedNvxR2PXsrI8oa72v+kOTwjt05Y/HqEvjnzXzMjf+Gd9XO/fBvsFK9j5
GbOwP0lwtmIRUc4VDkWUpycBtyu6tsv6WCmfWdBJQOgPtmR3bg4LRyoROLu1SIIjPAMRxJ3F
AXGEXQCCcj3W8oHII/QuO/qROgBxaXpnGyCIuPUNnXB515JLEJz8jLh+aza+SUHFV2wQ89xo
pVpLm9ffhrJSx42d6xnINeFqo0WklU94LWwRBXPOND/O5mPqwNQuCy8J4aDo3KCZJ0rnnEWA
c4wDd2eMj0o308i785zSjfBi4bnnarsru/c1wrNERy9yyjFjNx2do1ISBn0teZ6ZY9ZqXr/u
1vt96w3f7OBx7BEueNrt685+r9CQr4nA0F1u50cBmbD3aAB3ohy6HStWLw/b51H6/vxzvVO6
sAd3/+ZqELxmeUH4Rmm7ofAn0hLABfrB0YlZiGppuc31rybI17bjS0tozxO2E4Cki+Ykcuy4
IMFHvqzD4XmIbnQ0tzQIlf5VnMGQOQfpAES2fXLhFtsBnKLz90XN0vTycmHTL9Gwnd2GrSDG
gEdba/PEMkHvoHD0x/sNNDUbro317g31OUGg30v78/3m8WX19g6H0/vf6/u/4aTbUxqTj3qa
q4vmVsZ6ov5M2bLwePNzt4Kz9277/rZ56ctaqCdpt8nwoQdDtHTRXtNb9UfYuFKWL+HgnyWt
XosFEocpQU1DVIfgce/SimVF0JctGoK6NPLiYTk540MFMYbRbxi3OrYA2umVCR6KXxqRl1Vd
6ksNBD6jgPMzVzyaBhBzFvrLa0tWRaG4mIR4xZxmoojwiWtMoBJPMczYow/J3/Q2xtxXwi9V
iF3UK7w0yBJ3x9xB2WiYFvc0NmA3gIXHskSaPOvpF9b0xR0mm7/rxfXVIE0qn+ZDLPeuLgaJ
nu5O5ZBWRlXiDwgiB5FnkOqzH3pXNqlU2KLu2+rJHdesoDSCD4QzKyW+SzwrYXFH4DMi/WK4
yvS70Y75iYxxWJezEHql8DR9N9S2gTUZJmYSqunVaq1q6YHe8BSEHExBmLxXNVV5kOYFQVGX
9dWFrzuNRwp8SOwV6I01kvuo9hY+51kZ9zzay6JQH5rQvGR5BccMvbnBrc6C4qxXHP52zfY0
NrWZeHGLxzbbpVvAE1gc2uTn/jjQPieT/t4msEUUusf+LC1tdpyYblWKRPz1P9dGCdf/nGpr
R6DSdqZ9uIBuNzguXtSn9qBc3XY12IX6N9ntXihTX3ebl7e/RyCEjR6e1/vH4YOHdD4zlfZS
fRU3mYxOQq1X8Kzxdxtnkxg2t7jTNPhGIm4rHpY3Fwc1MyHwMXVQwsWhFT5qlTRNkW6orB1C
fmQnVW+e1n++bZ6b/Xwvofcqfad1yWFGy9BowFFt1nNh6vnwXUmFL0JRqBuZS4/A9dwr0huQ
ra7745rDWk9AMiFCTRUg9cmCAWUFVCmIABigM/GzmDAYlu2mNLdCDP+Moe2BH8T2e8Ysh4nA
70IAxTwdCEy9akTIpP5QwkXiGZb/7WcbENk1dZbGS4MbzT1YLqr38kxqzguzV5v0HuNRn5sV
DDpdRoxDT8y53YTo0/PgUL50CoqyZHFr3WewdqW3pG8BMuweF52f4+bBJlj/fH98NORUqU4Q
Lkp0gEoFVpMFIlDuHlaMLCabp8RBRJKh/9A9rHNIM/9HSN2girjyW5i9pRKBe41rcqrXskpQ
kRwUakbYlajOlWZY8tHM1WNqLuAGaGPZjMlNc+oJL9U8UzdUlSzbenP6X+bb22EojdIgE8tm
6HoF1dPYcK6KiPfnkrorxfJG8fb+7/dXNSmj1ctjjyOhV1hUaKvyxoM54bClcW8eYSSw0hP2
h/35LSw4WI6BeWPWWZ/Y26PPqBRWBqzszG4l0KOjhUoV3pz0ibjjoH5ilyx946l+6m2JmEzP
KpVLzSr0Vig5smNaYLXTMMxtkWTwiw+DO/rX/nXzgk8Z+z9Gz+9v63/W8I/12/1ff/3138Pd
AkWyqgwXxD1YM/4W02dzdh8tpJiLkIpXKAEgYaLHSBHDdzpgjZWGusiw+39opSa0B4Eph/59
aGc387lq/BHx5T/oZH0DhQGW68peNe4rwB9hk8TrPZgR6tzk+PqpYnYkY4f/ZhjmXITDZUz6
2GxYzxG6cPFgacvCqWBICsOKEGPHcK8vB6gbN1bZ9xogIFMc0wOICGqUNQhyVSlCdGv47NQo
hBwopIa3wqYt29qe99pvfjmwLrXfF5advj9+ctLC3oq3T4RqUtPVdVgUWQEbyg8lr1jBjZWK
E4MH8JQtDTft3RlNOk1IlUgku6jQT3A6dVJ4eWTHtP5gx5LqJNZzXkZ4vBFmPYqcSBNEAOCF
kQFBCxY5xIiUspdubgKJ8pxietrtGnXotv4H2+WTIgwTkDzhGAcngZRgQkCGXXDsKkhtBg5A
NIchcgEa4b7VwVFIwuJOdWLTUUQ0epm/Fqk38N7YHnHQTVuEVkBSad9UI2rT0eEwnuKDJgOx
QXTwOHYD1Ybp6IjWPSjPHKv5MDlqHyZ+lFBRq7QRluc4kr3AfASeIsk4wUyXP9LRnLzQFRnh
rktCSKrfbiNyk3KwQh+fFP+/sGvbQRiEoT9lfHfTOTIRsw2zN///L2xPXaZZT33lNCRAKfQe
4GpfEf22aMEVSgWNRX4/r3gykcoqUylu7/nxQB7W74X3l+Vcs//q286YhSFquLfSTS2J0wPB
IBQzyYsGAfR23xcP3KwfIS7CmVQ4BEWtpHo50AXmNI5r8mZ3K37EByhGdf/MKhCCDWfhBEAT
KcVqfDz4/xOAz8zVPVv8hLZD0RE1j2j71TfSW88iP8ynS/KfllP4c7c/xR+D/uvGUEiJDNbj
GHh+GRLBoTQ01pgyl4AjRHFsRfyHtwNuHKJYrpNQAsHo9TTFGTWL1UEz1l0m9CacT5qhRXLa
msltvIlxkfvpes9msN2HhJpp8A1zfw5gxzIBAA==

--otj32ebelstom3kh
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--otj32ebelstom3kh--
